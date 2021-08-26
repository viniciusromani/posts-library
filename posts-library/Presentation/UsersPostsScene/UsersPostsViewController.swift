import UIKit

class UsersPostsViewController: UIViewController {
    private var usersPostsView: UsersPostsView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UsersPostsView()
        self.view = view
    }
}
