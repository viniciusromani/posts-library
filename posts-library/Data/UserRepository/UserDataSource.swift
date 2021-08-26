import Foundation
import RxSwift

protocol UserDataSource {
    func retrieveUsersPosts() -> Single<UsersPostsResponse>
}
