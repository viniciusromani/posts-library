import Foundation

enum SourceOfDataModel {
    case api
    case cache
    case none
    
    init(mapping entity: SourceOfDataEntity) {
        switch entity {
        case .api: self = .api
        case .cache: self = .cache
        case .none: self = .none
        }
    }
}
