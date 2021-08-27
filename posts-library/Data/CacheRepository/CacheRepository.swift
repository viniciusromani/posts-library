import Foundation
import RxSwift
import CouchbaseLiteSwift

struct CacheRepository {
    private let kDocumentId = "kDocumentId"
    private let kEncodedValueInDocument = "kEncodedValueInDocument"
}

extension CacheRepository: CacheDataSource {
    func storeUsers(response: UsersPostsResponse) -> Completable {
        return Completable.create { completable in
            let dispose = Disposables.create()
            let manager = DatabaseManager.shared
            let encoded = try! response.utf8Encode()
            let document = MutableDocument(id: self.kDocumentId)
                .setString(encoded, forKey: self.kEncodedValueInDocument)
            manager.save(document)
            completable(.completed)
            return dispose
        }
    }
    
    func retrieveUsers() -> Single<UsersPostsResponse> {
        return Single.create { single in
            let dispose = Disposables.create()
            
            let manager = DatabaseManager.shared
            guard let document = manager.readDocument(id: self.kDocumentId) else {
                let exception = GeneralException()
                single(.failure(exception))
                return dispose
            }
            
            guard let string = document.string(forKey: self.kEncodedValueInDocument) else {
                let exception = GeneralException()
                single(.failure(exception))
                return dispose
            }
            
            let response = try! UsersPostsResponse.utf8Decode(from: string)
            single(.success(response))
            
            return Disposables.create()
        }
    }
}
