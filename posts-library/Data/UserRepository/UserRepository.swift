import Foundation
import RxSwift

struct UserRepository {
    private let cacheRepository: CacheRepository
    
    init(cacheRepository: CacheRepository) {
        self.cacheRepository = cacheRepository
    }
}

extension UserRepository: UserDataSource {
    func retrieveUsersPosts() -> Single<UsersPostsResponse> {
        let request: UsersPostsRequest = .init()
        
        let chain = RequestManager<UsersPostsResponse>()
            .request(request)
            .asObservable()
            .flatMapLatest { response in
                self.cacheRepository.storeUsers(response: response).andThen(Observable.just(response))
            }
            .catch { exception in
                guard let _ = exception.asAFError else {
                    let exc = UnknownException()
                    return Observable.error(exc)
                }
                
                return self.cacheRepository.retrieveUsers().asObservable()
            }
            .asSingle()
        
        return chain
    }
}
