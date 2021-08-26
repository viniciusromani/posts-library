import Foundation
import RxSwift


struct UsersPostsViewModel {
    
    private let fetchUsersPostsUseCase: FetchUsersPostsUseCase
    
    init(fetchUsersPostsUseCase: FetchUsersPostsUseCase) {
        self.fetchUsersPostsUseCase = fetchUsersPostsUseCase
    }
    
    public let loading = PublishSubject<Bool>()
}
