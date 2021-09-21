import UIKit
import Kingfisher

class TriplePictureView: PostPictureView {
    
    private let outterContainer = UIStackView()
    private let bigImage = UIImageView()
    private let innerContainer = UIStackView()
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
        super.addTapGesture(to: self.bigImage)
        super.addTapGesture(to: self.leftImage)
        super.addTapGesture(to: self.rightImage)
        
        self.innerContainer.addArrangedSubviews([self.leftImage,
                                                 self.rightImage])
        
        self.outterContainer.addArrangedSubviews([self.bigImage,
                                                  self.innerContainer])
        
        self.addSubview(self.outterContainer)
    }
    
    private func formatSubviews() {
        self.backgroundColor = .white
        
        self.outterContainer.axis = .vertical
        self.outterContainer.spacing = 8
        
        self.bigImage.layer.masksToBounds = true
        self.bigImage.layer.cornerRadius = 8
        self.bigImage.contentMode = .scaleAspectFill
        
        self.innerContainer.axis = .horizontal
        self.innerContainer.spacing = 8
        self.innerContainer.distribution = .fillEqually
        
        self.leftImage.layer.masksToBounds = true
        self.leftImage.layer.cornerRadius = 8
        self.leftImage.contentMode = .scaleAspectFill
        
        self.rightImage.layer.masksToBounds = true
        self.rightImage.layer.cornerRadius = 8
        self.rightImage.contentMode = .scaleAspectFill
    }
    
    private func addConstraintsToSubviews() {
        outterContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.bottom.right.equalToSuperview().inset(16)
        }
        
        bigImage.snp.makeConstraints { make in
            make.height.equalTo(350)
        }

        leftImage.snp.makeConstraints { make in
            make.height.equalTo(170)
        }

        rightImage.snp.makeConstraints { make in
            make.height.equalTo(self.leftImage)
        }
    }
}

extension TriplePictureView: PostPictureViewConfigurable {
    func configure(urls: [URL], delegate: UserPostTableViewCellDelegate?) {
        self.delegate = delegate
        
        self.bigImage.kf.setImage(with: urls.first, options: [.transition(.fade(0.5))])
        self.leftImage.kf.setImage(with: urls[1], options: [.transition(.fade(0.5))])
        self.rightImage.kf.setImage(with: urls.last, options: [.transition(.fade(0.5))])
    }
}
