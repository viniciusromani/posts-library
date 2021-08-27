import Foundation
import CouchbaseLiteSwift

class DatabaseManager {
    static let shared: DatabaseManager = {
        let instance = DatabaseManager()
        instance.initialize()
        return instance
    }()
    
    private func initialize() {
        do {
            self.database = try Database(name: "users-posts")
        } catch {
            print(error)
        }
    }
    
    private init() { }
    
    private var database: Database?
    
    func save(_ document: MutableDocument) {
        do {
            try self.database?.saveDocument(document)
        } catch {
            print(error)
        }
    }
    
    func saveBatch(_ documents: [MutableDocument]) {
        do {
            try self.database?.inBatch {
                documents.forEach(save)
            }
        } catch {
            print(error)
        }
    }
    
    func readDocument(id: String) -> Document? {
        let document = self.database?.document(withID: id)
        return document
    }
}
