import UIKit
import SnapKit

class UsersPostsView: UIView {
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
        self.addSubview(self.tableView)
    }
    
    private func formatViews() {
        self.tableView.separatorStyle = .none
        self.tableView.registerCell(UserPostTableViewCell.self)
        
        self.tableView.refreshControl = self.refreshControl
    }
    
    private func addConstraintsToSubviews() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
