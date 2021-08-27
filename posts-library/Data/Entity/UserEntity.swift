import Foundation

struct UserEntity {
    let name: String
    let email: String
    let profilePicture: String
    let posts: [PostEntity]
}

extension UserEntity: Codable {
    private enum CodingKeys: String, CodingKey {
        case name
        case email
        case profilePicture = "profile_pic"
        case posts
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
        self.profilePicture = try container.decode(String.self, forKey: .profilePicture)
        self.posts = try container.decode([PostEntity].self, forKey: .posts)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.profilePicture, forKey: .profilePicture)
        try container.encode(self.posts, forKey: .posts)
    }
}
