import Foundation
import Swinject
import UIKit


class DependencyInjection {
    private static let container = Container()
    
    static func configure(window: UIWindow?) -> Container {
        self.injectCoordinators(on: self.container, window: window)
        self.injectRepositories(on: self.container)
        self.injectUseCases(on: self.container)
        self.injectViewModels(on: self.container)
        self.injectScenes(on: self.container)
        return self.container
    }
}

extension DependencyInjection {
    private static func injectCoordinators(on container: Container,
                                           window: UIWindow?) {
        container.register(UINavigationController.self) { _ in
            let navigationController = UINavigationController()
//            navigationController.navigationBar.prefersLargeTitles = true
            return navigationController
        }.inObjectScope(.transient)
        
        container.register(AppCoordinator.self) { resolver in
            let coordinator = AppCoordinator(window: window,
                                             navigationController: resolver.resolve(UINavigationController.self)!,
                                             usersPostsViewController: resolver.resolve(UsersPostsViewController.self)!)
            return coordinator
        }
    }
    
    private static func injectRepositories(on container: Container) {
        container.register(UserRepository.self) { _ in
            let repository = UserRepository()
            return repository
        }
    }
    
    private static func injectUseCases(on container: Container) {
        container.register(FetchUsersPostsUseCase.self) { resolver in
            let useCase = FetchUsersPostsUseCase(repository: resolver.resolve(UserRepository.self)!)
            return useCase
        }
    }
    
    private static func injectViewModels(on container: Container) {
        container.register(UsersPostsViewModel.self) { resolver in
            let viewModel = UsersPostsViewModel(fetchUsersPostsUseCase: resolver.resolve(FetchUsersPostsUseCase.self)!)
            return viewModel
        }
    }
    
    private static func injectScenes(on container: Container) {
        container.register(UsersPostsViewController.self) { resolver in
            let viewController = UsersPostsViewController(viewModel: resolver.resolve(UsersPostsViewModel.self)!)
            return viewController
        }.inObjectScope(.weak)
    }
}
