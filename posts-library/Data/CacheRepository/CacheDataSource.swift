import Foundation
import RxSwift

protocol CacheDataSource {
    func storeUsers(response: UsersPostsResponse) -> Completable
    func retrieveUsers() -> Single<UsersPostsResponse>
}
