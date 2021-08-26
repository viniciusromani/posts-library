import Foundation


class CachedDateFormatter {
    struct Key: Equatable, Hashable {
        let format: String
        let locale: Locale
        
        static func == (lhs: Key, rhs: Key) -> Bool {
            return lhs.format == rhs.format &&
                   lhs.locale == rhs.locale
        }
    }
    
    static let shared = CachedDateFormatter()
    
    private init() { }
    
    private var cachedDateFormatters = [Key: DateFormatter]()
    
    private func cachedDateFormatter(dateFormat: String,
                                     locale: Locale = Locale(identifier: "pt_BR")) -> DateFormatter {
        let key = Key(format: dateFormat, locale: locale)
        if let cached = self.cachedDateFormatters[key] {
            return cached
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = dateFormat
        
        self.cachedDateFormatters[key] = dateFormatter
        
        return dateFormatter
    }
}

extension CachedDateFormatter {
    func serverDateFormat() -> DateFormatter {
        let format = "EEE MMM dd yyyy HH:mm:ss 'GMT'z"
        return self.cachedDateFormatter(dateFormat: format)
    }
}
