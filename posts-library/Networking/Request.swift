import Foundation


protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension Request {
    var parameters: [String: Any]? {
        nil
    }
    
    var headers: [String: String]? {
        nil
    }
}


enum HTTPMethod: String {
    case get = "get"
    case post = "post"
    case put = "put"
    case delete = "delete"
}

