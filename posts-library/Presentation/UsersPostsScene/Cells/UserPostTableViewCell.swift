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
        self.contentView.addSubview(self.header)
    }
    
    private func formatSubviews() {
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    private func addConstraintsToSubviews() {
        header.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().priority(.high)
        }
    }
}

extension UserPostTableViewCell {
    func configure(viewModel: UserSceneModel, delegate: UserPostTableViewCellDelegate?) {
        self.header.set(viewModel)
        
        let postsViews = viewModel.posts.compactMap { self.addPostView(for: $0, delegate: delegate) }
        var lastAdded: UIView = self.header

        postsViews.enumerated().forEach { index, postView in
            postView.snp.makeConstraints { make in
                make.top.equalTo(lastAdded.snp.bottom).priority(.high)
                make.left.right.equalToSuperview()
                guard index == postsViews.endIndex - 1 else { return }
                make.bottom.equalToSuperview().priority(.high)
            }
            lastAdded = postView
        }
    }
    
    private func addPostView(for viewModel: PostSceneModel, delegate: UserPostTableViewCellDelegate?) -> PostBodyView {
        let view = PostBodyView()
        self.contentView.addSubview(view)
        self.posts.append(view)
        view.configure(viewModel: viewModel, delegate: delegate)
        return view
    }
}
