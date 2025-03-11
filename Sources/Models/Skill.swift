
struct Skills {
    var languages: [String]
    var frameworks: [String]
    var tools: [String]
    var other: [String]
    
    var ordered: [String] {
        languages + frameworks + tools + other
    }
    
    static let all = Skills(
        languages: ["Swift", "Objective-C (basic)"],
        frameworks: ["Mapbox", "MapKit", "StoreKit", "Combine", "WidgetKit", "SwiftUI & UIKit", "CoreData", "SwiftData", "CloudKit", "The Composable Architecture (basic)"],
        tools: ["Firebase", "Swift Package Manager", "Trello", "Jira", "Monday", "Git/Github", ],
        other: ["Debugging", "Unit & Integration Testing", "Googling", "GCD & async-await", "REST APIs", "GraphQL APIs", "Algorithms", "Data Structures", "App Store Connect"]
    )
}
