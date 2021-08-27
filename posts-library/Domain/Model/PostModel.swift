import Foundation

struct PostModel {
    let id: String
    let date: Date?
    let pictures: [URL]
}

extension PostModel {
    init(mapping entity: PostEntity) {
        self.id = .init(entity.id)
        self.date = CachedDateFormatter.shared.serverDateFormat().date(from: entity.date)
        self.pictures = entity.pictures.compactMap { .init(string: $0) }
    }
    
    static func asArray(mapping entities: [PostEntity]) -> [PostModel] {
        return entities.map { .init(mapping: $0) }
    }
}
