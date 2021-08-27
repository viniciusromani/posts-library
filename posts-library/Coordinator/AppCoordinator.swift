import Foundation
import UIKit


class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    private var window: UIWindow?
    private let usersPostsViewController: UsersPostsViewController
    
    init(window: UIWindow?,
         navigationController: UINavigationController,
         usersPostsViewController: UsersPostsViewController) {
        self.childCoordinators = []
        self.window = window
        self.navigationController = navigationController
        self.usersPostsViewController = usersPostsViewController
    }
    
    func setWindow(_ window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        self.navigationController.pushViewController(self.usersPostsViewController, animated: false)
        
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
    }
}
