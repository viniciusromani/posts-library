import Foundation
import RxSwift
import UIKit

extension Reactive where Base: EmptableView {
    /// Bindable sink for `beginRefreshing()`, `endRefreshing()` methods.
    internal var isEmpty: Binder<Bool> {
        return Binder(self.base) { view, empty in
            empty ?
                view.displayEmptyState():
                view.hideEmptyState()
        }
    }
}
