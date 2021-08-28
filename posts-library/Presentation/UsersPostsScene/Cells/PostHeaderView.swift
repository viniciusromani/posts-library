import UIKit
import Kingfisher

class PostHeaderView: UIView {
    
    private let image = UIImageView()
    private let infoContainer = UIStackView()
    private let name = UILabel()
    private let email = UILabel()
    
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
        self.infoContainer.addArrangedSubviews([self.name,
                                                self.email])
        self.addSubviews([self.image,
                          self.infoContainer])
    }
    
    private func formatViews() {
        self.backgroundColor = .white
        
        self.image.layer.masksToBounds = true
        self.image.layer.cornerRadius = 44 / 2
        self.image.contentMode = .scaleAspectFill
        
        self.infoContainer.axis = .vertical
        
        self.name.font = .boldSystemFont(ofSize: 16)
        self.name.tintColor = .black
        
        self.email.font = .systemFont(ofSize: 14)
        self.email.tintColor = .black
    }
    
    private func addConstraintsToSubviews() {
        image.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.width.height.equalTo(44)
            make.centerY.equalToSuperview()
        }
        
        infoContainer.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.left.equalTo(self.image.snp.right).offset(8)
            make.right.equalToSuperview()
        }
    }
}

extension PostHeaderView {
    func set(_ viewModel: UserSceneModel) {
        self.name.text = viewModel.name
        self.email.text = viewModel.email
        self.image.kf.setImage(with: viewModel.profilePicture, options: [.transition(.fade(0.5))])
    }
}
