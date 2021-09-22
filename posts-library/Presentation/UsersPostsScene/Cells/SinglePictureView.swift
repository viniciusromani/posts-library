import UIKit
import Kingfisher
import RxSwift

class SinglePictureView: UIView {
    private let image = UIImageView()
    
    weak var delegate: UserPostTableViewCellDelegate?
    var disposeBag: DisposeBag = DisposeBag()
    
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
        self.addTapGesture(to: self.image)
        
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
            make.height.equalTo(350)
            make.top.equalToSuperview().inset(8)
            make.left.right.bottom.equalToSuperview().inset(16)
        }
    }
}

extension SinglePictureView: PostPictureViewConfigurable {
    func configure(urls: [URL], delegate: UserPostTableViewCellDelegate?) {
        self.delegate = delegate
        
        self.image.kf.setImage(with: urls.first, options: [.transition(.fade(0.5))])
    }
}

extension SinglePictureView: PostPictureView {
    
}
