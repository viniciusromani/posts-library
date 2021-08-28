import Foundation
import RxSwift

protocol UserDataSource {
    func retrieveUsersPosts() -> Single<(source: SourceOfDataEntity, response: UsersPostsResponse)>
}
