import Foundation

class UnknownException: NSError {
    init() {
        super.init(domain: "unknow",
                   code: 1,
                   userInfo: [NSLocalizedDescriptionKey: "Well.. Something very weird have happened, please contact on support"])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
