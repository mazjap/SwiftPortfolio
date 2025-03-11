import Foundation

extension DateFormatter {
    private convenience init(dateFormat: String) {
        self.init()
        
        self.dateFormat = dateFormat
    }
    
    static let portfolioFormatter = DateFormatter(dateFormat: "MMM yyyy")
    static fileprivate let inputFormatter = DateFormatter(dateFormat: "yyyy-MM-dd")
}

enum ParseError: Error {
    case cannotParse(dateString: String, usingFormat: String)
}

extension Date {
    init(portfolioDateString: String) throws {
        guard let date = DateFormatter.inputFormatter.date(from: portfolioDateString) else {
            throw ParseError.cannotParse(dateString: portfolioDateString, usingFormat: DateFormatter.inputFormatter.dateFormat)
        }
        
        self = date
    }
}
