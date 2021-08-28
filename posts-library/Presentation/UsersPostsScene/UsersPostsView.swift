import UIKit
import SnapKit

class UsersPostsView: UIView {
    private let container = UIStackView()
    private let statusPreffix = UILabel()
    let status = UILabel()
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    init() {
        super.init(frame: .zero)
        self.buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.addSubviews()
        self.formatViews()
        self.addConstraintsToSubviews()
    }
    
    private func addSubviews() {
        self.container.addArrangedSubviews([self.statusPreffix,
                                            self.status])
        self.addSubviews([self.container,
                          self.tableView])
    }
    
    private func formatViews() {
        self.backgroundColor = .white
        
        self.container.axis = .horizontal
        self.container.spacing = 4
        
        self.statusPreffix.textAlignment = .right
        self.statusPreffix.text = "Your are seeing data from"
        self.statusPreffix.textColor = .black
        self.statusPreffix.font = .systemFont(ofSize: 12)
        
        self.status.textColor = .gray
        self.status.font = .systemFont(ofSize: 16)
        self.status.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        self.tableView.refreshControl = self.refreshControl
        self.tableView.separatorStyle = .none
        self.tableView.registerCell(UserPostTableViewCell.self)
    }
    
    private func addConstraintsToSubviews() {
        container.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(16)
            make.left.right.equalToSuperview().inset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.container.snp.bottom).offset(24)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
