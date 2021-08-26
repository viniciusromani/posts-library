import Foundation

struct PostEntity {
    let id: Int
    let date: String
    let pictures: [String]
}

extension PostEntity: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case date
        case pictures = "pics"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.date = try container.decode(String.self, forKey: .date)
        self.pictures = try container.decode([String].self, forKey: .pictures)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.pictures, forKey: .pictures)
    }
}
