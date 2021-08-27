import Foundation

class GeneralException: NSError {
    init() {
        super.init(domain: "general",
                   code: 0,
                   userInfo: [NSLocalizedDescriptionKey: "Oops! Check your internet connection and try again :)"])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
