import Foundation

struct UsersPostsResponse {
    let data: [UserEntity]
}

extension UsersPostsResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([UserEntity].self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.data, forKey: .data)
    }
}

extension UsersPostsResponse: CachableEntity { }
