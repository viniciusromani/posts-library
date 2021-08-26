import Foundation
import UIKit


class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    private let window: UIWindow
    var navigationController: UINavigationController
    
    init(window: UIWindow,
         navigationController: UINavigationController) {
        self.childCoordinators = []
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = UsersPostsViewController()
        self.navigationController.pushViewController(viewController, animated: false)
        
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
    }
}
