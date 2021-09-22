import UIKit
import RxSwift

protocol PostPictureView {
    var delegate: UserPostTableViewCellDelegate? { get }
    var disposeBag: DisposeBag { get }
    
    func addTapGesture(to imageView: UIImageView)
}

extension PostPictureView {
    func addTapGesture(to imageView: UIImageView) {
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer()
        imageView.addGestureRecognizer(tap)
        
        tap.rx.event.bind { sender in
            guard let view = sender.view as? UIImageView else { return }
            self.delegate?.didTap(image: view.image)
        }.disposed(by: self.disposeBag)
    }
}
