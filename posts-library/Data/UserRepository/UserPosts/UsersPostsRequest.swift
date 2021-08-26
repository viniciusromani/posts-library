import Foundation

struct UsersPostsRequest: Request {
    var path: String {
        "users/posts"
    }
    
    var method: HTTPMethod {
        .get
    }
}
