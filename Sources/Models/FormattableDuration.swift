import struct Foundation.Date
import class Foundation.DateFormatter

protocol FormattableDuration {
    var startDate: Date { get }
    var endDate: Date? { get }
    var duration: String { get }
}

extension FormattableDuration {
    var duration: String {
        let formatter = DateFormatter.portfolioFormatter
        
        let start = formatter.string(from: startDate)
        let end = endDate.map { formatter.string(from: $0) } ?? "Present"
        
        return "\(start) - \(end)"
    }
}
