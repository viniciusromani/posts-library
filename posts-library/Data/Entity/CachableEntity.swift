import Foundation

protocol CachableEntity {
    
}
extension CachableEntity {
    var encoder: JSONEncoder {
        let _encoder = JSONEncoder()
        _encoder.outputFormatting = .prettyPrinted
        return _encoder
    }
    
    static var decoder: JSONDecoder {
        let _decoder = JSONDecoder()
        return _decoder
    }
}
extension CachableEntity where Self: Codable {
    func utf8Encode() throws -> String {
        do {
            let data = try self.encoder.encode(self)
            
            if let string = String(data: data, encoding: .utf8) {
                return string
            } else {
                let exception = JSONParseException()
                throw exception
            }
        } catch {
            throw error
        }
    }
    
    static func utf8Decode(from string: String) throws -> Self {
        do {
            guard let data = string.data(using: .utf8) else {
                let exception = JSONParseException()
                throw exception
            }
            
            let decoded = try self.decoder.decode(Self.self, from: data)
            return decoded
        } catch {
            throw error
        }
    }
}
