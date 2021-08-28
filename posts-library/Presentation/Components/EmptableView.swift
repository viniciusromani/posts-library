import UIKit

protocol EmptableView: AnyObject {
    var emptyStateView: UIView { get set }
    
    func displayEmptyState()
    func showEmpty(at view: UIView)
    func hideEmptyState()
}

extension EmptableView where Self: UIView {
    func showEmpty(at view: UIView) {
        view.addSubview(self.emptyStateView)
        
        emptyStateView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(30)
        }
        
        view.bringSubviewToFront(self.emptyStateView)
    }
    
    func hideEmptyState() {
        self.emptyStateView.removeFromSuperview()
    }
}
