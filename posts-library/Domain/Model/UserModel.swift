import Foundation

struct UserModel {
    let name: String
    let email: String
    let profilePicture: URL?
    let posts: [PostModel]
}

extension UserModel {
    init(mapping entity: UserEntity) {
        self.name = entity.name
        self.email = entity.email
        self.profilePicture = .init(string: entity.profilePicture)
        self.posts = PostModel.asArray(mapping: entity.posts)
    }
    
    static func asArray(mapping entities: [UserEntity]) -> [UserModel] {
        return entities.map { .init(mapping: $0) }
    }
}
