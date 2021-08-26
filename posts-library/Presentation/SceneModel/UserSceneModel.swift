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
        self.email = entity.email
        self.profilePicture = entity.profilePicture
        self.posts = PostSceneModel.asArray(mapping: entity.posts)
    }
}
