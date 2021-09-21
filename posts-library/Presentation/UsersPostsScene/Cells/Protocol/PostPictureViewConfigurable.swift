import UIKit

protocol PostPictureViewConfigurable: UIView {
    func configure(urls: [URL], delegate: UserPostTableViewCellDelegate?)
}
