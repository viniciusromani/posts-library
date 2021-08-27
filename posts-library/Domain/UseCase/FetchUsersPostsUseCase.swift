import Foundation
import RxSwift


struct FetchUsersPostsUseCase: SingleUseCase {
    
    typealias Params = Void
    typealias Model = [UserModel]
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(with params: Void? = nil) -> Single<[UserModel]> {
        return self.repository.retrieveUsersPosts()
            .map { [UserModel.asArray(mapping: $0.data)[2], UserModel.asArray(mapping: $0.data)[2], UserModel.asArray(mapping: $0.data)[2], UserModel.asArray(mapping: $0.data)[2], UserModel.asArray(mapping: $0.data)[2], UserModel.asArray(mapping: $0.data)[2], UserModel.asArray(mapping: $0.data)[2]] }
    }
}
