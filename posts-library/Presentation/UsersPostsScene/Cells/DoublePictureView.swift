import UIKit
import Kingfisher

class DoublePictureView: PostPictureView {
    
    private let container = UIStackView()
    private let leftImage = UIImageView()
    private let rightImage = UIImageView()
    
    init() {
        super.init(frame: .zero)
        self.buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.addSubviews()
        self.formatSubviews()
        self.addConstraintsToSubviews()
    }
    
    private func addSubviews() {
        super.addTapGesture(to: self.leftImage)
        super.addTapGesture(to: self.rightImage)
        
        self.container.addArrangedSubviews([self.leftImage,
                                            self.rightImage])
        self.addSubview(self.container)
    }
    
    private func formatSubviews() {
        self.backgroundColor = .white
        
        self.container.axis = .horizontal
        self.container.spacing = 8
        self.container.distribution = .fillEqually
        
        self.leftImage.layer.masksToBounds = true
        self.leftImage.layer.cornerRadius = 8
        self.leftImage.contentMode = .scaleAspectFill
        
        self.rightImage.layer.masksToBounds = true
        self.rightImage.layer.cornerRadius = 8
        self.rightImage.contentMode = .scaleAspectFill
    }
    
    private func addConstraintsToSubviews() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.right.bottom.equalToSuperview().inset(16)
        }
        
        leftImage.snp.makeConstraints { make in
            make.height.equalTo(170)
        }
        
        rightImage.snp.makeConstraints { make in
            make.height.equalTo(self.leftImage)
        }
    }
}

extension DoublePictureView: PostPictureViewConfigurable {
    func configure(urls: [URL], delegate: UserPostTableViewCellDelegate?) {
        self.delegate = delegate
        
        self.leftImage.kf.setImage(with: urls.first, options: [.transition(.fade(0.5))])
        self.rightImage.kf.setImage(with: urls.last, options: [.transition(.fade(0.5))])
    }
}
