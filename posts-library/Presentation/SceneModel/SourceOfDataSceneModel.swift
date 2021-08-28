import Foundation

enum SourceOfDataSceneModel {
    case api
    case cache
    case none
    
    init(mapping model: SourceOfDataModel) {
        switch model {
        case .api: self = .api
        case .cache: self = .cache
        case .none: self = .none
        }
    }
    
    var userFriendlyDescription: String {
        switch self {
        case .api: return "API"
        case .cache: return "Cache"
        case .none: return "No Data"
        }
    }
}
