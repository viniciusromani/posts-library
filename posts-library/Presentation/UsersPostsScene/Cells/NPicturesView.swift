import UIKit
import Kingfisher

class NPicturesView: PostPictureView {
    
    private let bigImage = UIImageView()
    let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        
        self.addSubviews([self.bigImage,
                          self.collection])
    }
    
    private func formatSubviews() {
        self.backgroundColor = .white
        
        self.bigImage.layer.masksToBounds = true
        self.bigImage.layer.cornerRadius = 8
        self.bigImage.contentMode = .scaleAspectFill
    }
    
    private func addConstraintsToSubviews() {
        bigImage.snp.makeConstraints { make in
            make.height.equalTo(350)
            make.top.equalToSuperview().inset(8)
            make.left.right.bottom.equalToSuperview().inset(16)
        }
    }
}

extension NPicturesView: PostPictureViewConfigurable {
    func configure(urls: [URL], delegate: UserPostTableViewCellDelegate?) {
        self.delegate = delegate
        
        self.bigImage.kf.setImage(with: urls.first, options: [.transition(.fade(0.5))])
    }
}
