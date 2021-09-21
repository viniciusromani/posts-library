import UIKit
import Kingfisher

class NPicturesCollectionViewCell: UICollectionViewCell {
    private let image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.addSubviews()
        self.formatSubviews()
        self.addConstraintsToSubviews()
    }

    private func addSubviews() {
        self.contentView.addSubview(self.image)
    }

    private func formatSubviews() {
        self.backgroundColor = .white
        
        self.image.layer.masksToBounds = true
        self.image.layer.cornerRadius = 8
        self.image.contentMode = .scaleAspectFill
    }
    
    private func addConstraintsToSubviews() {
        image.snp.makeConstraints { make in
//            make.height.equalTo(170)
//            make.top.equalToSuperview().inset(8)
//            make.left.right.bottom.equalToSuperview().inset(16)
            
            
            make.edges.equalToSuperview().inset(16)
        }
    }
}

extension NPicturesCollectionViewCell {
    func configure(image: URL?) {
        self.image.kf.setImage(with: image, options: [.transition(.fade(0.5))])
    }
}
