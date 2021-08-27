import Foundation

struct PostSceneModel {
    enum CellType: Int {
        case single = 1
        case double
        case triple
        case n
    }
    
    let date: String?
    let pictures: [URL]
    let type: CellType
}

extension PostSceneModel {
    init(mapping entity: PostModel) {
        if let unwrapped = entity.date {
            self.date = CachedDateFormatter.shared.userFriendlyFormat().string(from: unwrapped).capitalized
        } else {
            self.date = nil
        }
        self.pictures = entity.pictures
        self.type = .init(rawValue: entity.pictures.count) ?? .n
    }
    
    static func asArray(mapping entities: [PostModel]) -> [PostSceneModel] {
        return entities.map { PostSceneModel(mapping: $0) }
    }
}
