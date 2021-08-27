import Foundation
import RxSwift


struct UserRepository { }

extension UserRepository: UserDataSource {
    func retrieveUsersPosts() -> Single<UsersPostsResponse> {
        let request: UsersPostsRequest = .init()
        return RequestManager<UsersPostsResponse>()
            .request(request)
            .do(onError: { _ in throw GeneralException() })
    }
}
