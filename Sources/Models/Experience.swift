import Foundation

struct Experience: FormattableDuration, FormattableDescription {
    let jobTitle: String
    let company: String
    let startDate: Date
    let endDate: Date?
    let description: String
    let website: URL?
}

extension Experience {
    static let all = [
        Experience(
            jobTitle: "iOS Developer",
            company: "Self-Employed",
            startDate: try! Date(portfolioDateString: "2023-10-20"),
            endDate: nil,
            description: """
Worked on a wide array of projects to build a stronger understanding of my tools. See the list of projects below for a taste of what I've been working on.
""",
            website: URL(static: "https://jordan-christensen.com/")
        ),
        Experience(
            jobTitle: "iOS Developer",
            company: "Wander App Inc",
            startDate: try! Date(portfolioDateString: "2021-02-17"),
            endDate: try! Date(portfolioDateString: "2023-10-20"),
            description: """
Worked on developing and maintaining the company's iOS application using Swift.

What I did:

- Transition the UIKit-based app to SwiftUI

- Majorly improved the performance of the Mapbox map

- Added the ability to save map tiles for offline use

- Transitioned the app from GCD completion handler-based concurrency to async-await

- General maintanence and bug fixing

Please note, the app now uses React Native and no longer reflects the work that I did while there.
""",
            website: URL(static: "https://wandermaps.com/")
        )
    ]
}
