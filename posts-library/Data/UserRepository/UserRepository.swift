import Foundation
import RxSwift


struct UserRepository { }

extension UserRepository: UserDataSource {
    func retrieveUsersPosts() -> Single<UsersPostsResponse> {
        let request = UsersPostsRequest()
        return RequestManager<UsersPostsResponse>().request(request)
    }
}
