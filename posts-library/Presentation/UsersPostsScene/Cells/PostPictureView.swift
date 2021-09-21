import UIKit

class PostPictureView: UIView {
    weak var delegate: UserPostTableViewCellDelegate?
    
    func addTapGesture(to imageView: UIImageView) {
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        imageView.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        self.delegate?.didTap(image: imageView.image)
    }
}
