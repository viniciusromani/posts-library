import Foundation
import RxSwift
import RxCocoa

class UsersPostsViewModel {
    
    private let fetchUsersPostsUseCase: FetchUsersPostsUseCase
    
    private let loadingIndicator = ActivityIndicator()
    public var loading = PublishSubject<Bool>()
    public let users = PublishSubject<[UserSceneModel]>()
    public let status = PublishSubject<SourceOfDataSceneModel>()
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
                onNext: { [weak self] tuple in
                    let users = UserSceneModel.asArray(mapping: tuple.models)
                    self?.users.onNext(users)
                    
                    let status = SourceOfDataSceneModel(mapping: tuple.source)
                    self?.status.onNext(status)
                }, onError: { [weak self] exception in
                    let status = SourceOfDataSceneModel.none
                    self?.status.onNext(status)
                }
            ).disposed(by: self.disposeBag)
    }
}
