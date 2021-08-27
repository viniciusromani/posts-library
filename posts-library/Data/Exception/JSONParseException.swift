import Foundation

class JSONParseException: NSError {
    init() {
        super.init(domain: "parse",
                   code: 1,
                   userInfo: [NSLocalizedDescriptionKey: "Oops! We could not parse your JSON, check its format!"])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
