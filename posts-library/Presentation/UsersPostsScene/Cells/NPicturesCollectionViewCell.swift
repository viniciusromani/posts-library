import UIKit
import Kingfisher
import RxSwift

class NPicturesCollectionViewCell: UICollectionViewCell {
    private let image = UIImageView()
    
    weak var delegate: UserPostTableViewCellDelegate?
    var disposeBag: DisposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.addTapGesture(to: self.image)
        
        self.addSubviews()
        self.formatSubviews()
        self.addConstraintsToSubviews()
    }

    private func addSubviews() {
        self.addSubview(self.image)
    }

    private func formatSubviews() {
        self.backgroundColor = .white
        
        self.image.layer.masksToBounds = true
        self.image.layer.cornerRadius = 8
        self.image.contentMode = .scaleAspectFill
    }
    
    private func addConstraintsToSubviews() {
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension NPicturesCollectionViewCell: PostPictureView {
    
}

extension NPicturesCollectionViewCell: PostPictureViewConfigurable {
    func configure(urls: [URL], delegate: UserPostTableViewCellDelegate?) {
        self.delegate = delegate
        
        self.image.kf.setImage(with: urls.first, options: [.transition(.fade(0.5))])
    }
}
