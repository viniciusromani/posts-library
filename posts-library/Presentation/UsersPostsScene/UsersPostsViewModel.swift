import Foundation
import RxSwift
import RxCocoa

class UsersPostsViewModel {
    
    private let fetchUsersPostsUseCase: FetchUsersPostsUseCase
    
    private let loadingIndicator = ActivityIndicator()
    public var loading = PublishSubject<Bool>()
    public let users = PublishSubject<[UserSceneModel]>()
    public let error = PublishSubject<Error>()
    private let disposeBag = DisposeBag()
    
    init(fetchUsersPostsUseCase: FetchUsersPostsUseCase) {
        self.fetchUsersPostsUseCase = fetchUsersPostsUseCase
        
        self.loadingIndicator
            .asObservable()
            .subscribe(onNext: { self.loading.onNext($0) })
            .disposed(by: self.disposeBag)
    }
    
    func fetchUsersPosts() {
        self.fetchUsersPostsUseCase.execute()
            .trackActivity(self.loadingIndicator)
            .subscribe(
                onNext: { [weak self] models in
                    let viewModels = UserSceneModel.asArray(mapping: models)
                    self?.users.onNext(viewModels)
                }, onError: { [weak self] exception in
                    self?.error.onNext(exception)
                }
            ).disposed(by: self.disposeBag)
    }
}
