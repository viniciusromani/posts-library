import Foundation

struct UsersPostsResponse {
    let data: [UserEntity]
}

extension UsersPostsResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([UserEntity].self, forKey: .data)
    }
}
