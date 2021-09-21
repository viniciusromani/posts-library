import UIKit
import SnapKit

class PictureDetailView: UIView {
    private let blur = UIVisualEffectView()
    private let image = UIImageView()
    
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
        self.insertSubview(self.blur, at: 0)
        self.addSubview(self.image)
    }
    
    private func formatViews() {
        self.blur.effect = UIBlurEffect(style: .systemThinMaterialDark)
        self.blur.translatesAutoresizingMaskIntoConstraints = false
        
        self.image.contentMode = .scaleAspectFill
    }
    
    private func addConstraintsToSubviews() {
        blur.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.left.right.centerY.equalToSuperview()
            make.height.equalTo(375)
        }
    }
}

extension PictureDetailView {
    func set(image: UIImage?) {
        self.image.image = image
    }
}
