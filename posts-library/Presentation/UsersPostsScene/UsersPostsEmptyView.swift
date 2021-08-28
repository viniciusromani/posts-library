import UIKit

class UsersPostsEmptyView: UIView {
    private let message = UILabel()
    
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
        self.addSubview(self.message)
    }
    
    private func formatViews() {
        self.backgroundColor = .clear
        
        self.message.text = "Nothing was fetched, try to reload once you have a good internet connection :)"
        self.message.numberOfLines = 0
        self.message.textColor = .gray
        self.message.font = .systemFont(ofSize: 14)
        self.message.textAlignment = .center
    }
    
    private func addConstraintsToSubviews() {
        message.snp.makeConstraints { make in
            make.edges.centerX.equalToSuperview()
        }
    }
}
