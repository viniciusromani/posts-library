import UIKit
import Kingfisher

class UserPostTableViewCell: UITableViewCell {
    private let header = PostHeaderView()
    private var posts: [PostBodyView] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.buildViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.posts.forEach { $0.removeFromSuperview() }
    }
    
    private func buildViews() {
        self.addSubviews()
        self.formatSubviews()
        self.addConstraintsToSubviews()
    }
    
    private func addSubviews() {
        self.addSubview(self.header)
    }
    
    private func formatSubviews() {
        self.backgroundColor = .white
    }
    
    private func addConstraintsToSubviews() {
        header.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(16)
        }
    }
}

extension UserPostTableViewCell {
    func set(cell viewModel: UserSceneModel) {
        self.header.set(viewModel)
        
        let postsViews = viewModel.posts.compactMap(addPostView)
        var lastAdded: UIView = self.header
        
        postsViews.enumerated().forEach { index, postView in
            postView.snp.makeConstraints { make in
                make.top.equalTo(lastAdded.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(16)
                guard index == postsViews.endIndex - 1 else { return }
                make.bottom.equalToSuperview().inset(16)
            }
            lastAdded = postView
        }
    }
    
    private func addPostView(for viewModel: PostSceneModel) -> PostBodyView {
        let view = PostBodyView()
        self.addSubview(view)
        self.posts.append(view)
        view.set(viewModel)
        return view
    }
}
