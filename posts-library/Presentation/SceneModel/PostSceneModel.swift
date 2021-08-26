import Foundation

struct PostSceneModel {
    let date: String?
    let pictures: [URL]
}

extension PostSceneModel {
    init(mapping entity: PostModel) {
        if let unwrapped = entity.date {
            self.date = CachedDateFormatter.shared.userFriendlyFormat().string(from: unwrapped)
        } else {
            self.date = nil
        }
        self.pictures = entity.pictures
    }
    
    static func asArray(mapping entities: [PostModel]) -> [PostSceneModel] {
        return entities.map { PostSceneModel(mapping: $0) }
    }
}
