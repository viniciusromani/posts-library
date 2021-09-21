import UIKit

extension UICollectionView {
    func registerCell(_ cellClass: UICollectionViewCell.Type) {
        self.register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Cell of type \(String(describing: T.self)) was not registered on collection view")
        }
        return cell
    }
}
