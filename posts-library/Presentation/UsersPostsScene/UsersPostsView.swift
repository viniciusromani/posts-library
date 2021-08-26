import UIKit
import SnapKit

class UsersPostsView: UIView {
    let tableView = UITableView()
    
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
        self.tableView.backgroundColor = .yellow
    }
    
    private func addConstraintsToSubviews() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
