import Foundation

struct UserSceneModel {
    let name: String
    let email: String
    let profilePicture: URL?
    let posts: [PostSceneModel]
}

extension UserSceneModel {
    init(mapping entity: UserModel) {
        self.name = entity.name
        self.email = entity.email.lowercased()
        self.profilePicture = entity.profilePicture
        self.posts = PostSceneModel.asArray(mapping: entity.posts)
    }
    
    static func asArray(mapping entities: [UserModel]) -> [UserSceneModel] {
        return entities.map { .init(mapping: $0) }
    }
}
