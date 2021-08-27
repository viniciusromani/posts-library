import Foundation
import RxSwift

class UsersPostsViewModel {
    
    private let fetchUsersPostsUseCase: FetchUsersPostsUseCase
    
    public let loading = PublishSubject<Bool>()
    public let users = PublishSubject<[UserSceneModel]>()
    private let bag = DisposeBag()
    
    init(fetchUsersPostsUseCase: FetchUsersPostsUseCase) {
        self.fetchUsersPostsUseCase = fetchUsersPostsUseCase
    }
    
    func fetchUsersPosts() {
        self.fetchUsersPostsUseCase.execute().subscribe(
            onSuccess: { [weak self] models in
                let viewModels = UserSceneModel.asArray(mapping: models)
                self?.users.onNext(viewModels)
            }, onFailure: { [weak self] exception in
                print("errou")
            }
        ).disposed(by: self.bag)
    }
}
