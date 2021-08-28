import Foundation
import RxSwift


struct FetchUsersPostsUseCase: SingleUseCase {
    
    typealias Params = Void
    typealias Model = (source: SourceOfDataModel, models: [UserModel])
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(with params: Void? = nil) -> Single<(source: SourceOfDataModel, models: [UserModel])> {
        return self.repository.retrieveUsersPosts()
            .map { tuple in
                let mapped = (source: SourceOfDataModel(mapping: tuple.source),
                              models: UserModel.asArray(mapping: tuple.response.data))
                return mapped
            }
    }
}
