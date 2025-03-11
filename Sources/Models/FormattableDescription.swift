protocol FormattableDescription {
    var description: String { get }
}

extension FormattableDescription {
    var formattedDescription: [String] {
        description.split(separator: "\n").map { String($0) }
    }
}
