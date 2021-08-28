import UIKit
import RxCocoa
import RxSwift

class UsersPostsViewController: UIViewController {
    private var usersPostsView: UsersPostsView!
    private let viewModel: UsersPostsViewModel
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: UsersPostsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.usersPostsView = UsersPostsView()
        self.view = self.usersPostsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Posts"
        self.setBindings()
        self.viewModel.fetchUsersPosts()
    }
}

extension UsersPostsViewController {
    private func setBindings() {
        self.usersPostsView.refreshControl.rx.controlEvent(.valueChanged)
            .subscribe(onNext: { [weak self] in self?.viewModel.fetchUsersPosts() })
            .disposed(by: self.disposeBag)
        
        self.viewModel.users
            .subscribe(on: MainScheduler.instance)
            .bind(to: self.usersPostsView.tableView.rx.items) { tableView, row, element in
                let indexPath = IndexPath(row: row, section: 0)
                let cell: UserPostTableViewCell = tableView.dequeueReusableCell(for: indexPath)
                cell.set(cell: element)
                return cell
            }.disposed(by: self.disposeBag)
        
        self.viewModel.users
            .map { $0.count == 0 }
            .bind(to: self.usersPostsView.rx.isEmpty)
            .disposed(by: self.disposeBag)
        
        self.viewModel.status
            .subscribe(on: MainScheduler.instance)
            .map { $0.userFriendlyDescription }
            .bind(to: self.usersPostsView.status.rx.text)
            .disposed(by: self.disposeBag)
        
        self.viewModel.loading
            .subscribe(on: MainScheduler.instance)
            .bind(to: self.usersPostsView.refreshControl.rx.isRefreshing)
            .disposed(by: self.disposeBag)
    }
}
