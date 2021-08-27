import UIKit
import RxCocoa
import RxSwift

class UsersPostsViewController: UIViewController {
    private var usersPostsView: UsersPostsView!
    private let viewModel: UsersPostsViewModel
    
    private let bag = DisposeBag()
    
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
        
        self.setBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.fetchUsersPosts()
    }
}

extension UsersPostsViewController {
    private func setBindings() {
        self.viewModel.users
            .subscribe(on: MainScheduler.instance)
            .bind(to: self.usersPostsView.tableView.rx.items) { tableView, row, element in
                let indexPath = IndexPath(row: row, section: 0)
                let cell: UserPostTableViewCell = tableView.dequeueReusableCell(for: indexPath)
                cell.set(cell: element)
                return cell
            }.disposed(by: self.bag)
    }
}
