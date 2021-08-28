import Foundation
import RxSwift

struct UserRepository {
    private let cacheRepository: CacheRepository
    
    init(cacheRepository: CacheRepository) {
        self.cacheRepository = cacheRepository
    }
}

extension UserRepository: UserDataSource {
    func retrieveUsersPosts() -> Single<(source: SourceOfDataEntity, response: UsersPostsResponse)> {
        let request: UsersPostsRequest = .init()
        
        let chain = RequestManager<UsersPostsResponse>()
            .request(request)
            .asObservable()
            .flatMap { response in
                self.cacheRepository.storeUsers(response: response)
                    .andThen(Observable.just((source: SourceOfDataEntity.api, response: response)))
            }
            .catch { exception in
                guard let _ = exception.asAFError else {
                    let unknown = UnknownException()
                    return Observable.error(unknown)
                }

                return self.cacheRepository.retrieveUsers()
                    .asObservable()
                    .map { response -> (source: SourceOfDataEntity, response: UsersPostsResponse) in
                        let source: SourceOfDataEntity = .cache
                        let posts = response ?? UsersPostsResponse(data: [])
                        let tuple = (source: source, response: posts)
                        return tuple
                    }
            }
            .catchAndReturn((source: SourceOfDataEntity.none, response: UsersPostsResponse(data: [])))
            .asSingle()
        
        return chain
    }
}
