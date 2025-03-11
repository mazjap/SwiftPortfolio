import struct Foundation.URL

enum ProjectAppstoreAccess {
    case appstore(URL)
    case testflight(URL)
}

struct CarouselContent {
    let folderName: String
    let imageCount: Int
    let videoCount: Int
    
    var isEmpty: Bool {
        imageCount == 0 && videoCount == 0
    }
    
    var iterableImages: [String] {
        var paths = [String]()
        
        if imageCount > 0 {
            for i in 1...imageCount {
                paths.append("images/projects/\(folderName)/\(i).png")
            }
        }
        
        return paths
    }
    
    var iterableVideos: [String] {
        var paths = [String]()
        
        if videoCount > 0 {
            for i in 1...videoCount {
                paths.append("images/projects/\(folderName)/\(i).mp4")
            }
        }
        
        return paths
    }
}

struct Project: FormattableDescription {
    let name: String
    let language: String
    let techStack: [String]
    let description: String
    let website: URL?
    let appstoreAccess: ProjectAppstoreAccess?
    let github: URL?
    let carouselContent: CarouselContent
    
    var hasLinks: Bool {
        !(website == nil && appstoreAccess == nil && github == nil)
    }
}

extension Project {
    static let all = [
        Project(
            name: "SwiftNES",
            language: "Swift",
            techStack: ["AsyncThrowingStream", "AVFoundation"],
            description: "A Nintendo Entertainment System (NES) emulator written in Swift. The goal of this project is to deepen understanding of system architecture, assembly language, and the inner workings of the NES by accurately replicating its functionality. It's currently in Development, with the CPU (MOS 6502), MMU, and some Mappers done. The PPU is in Development, then comes the APU.",
            website: nil,
            appstoreAccess: nil,
            github: URL(static: "https://github.com/mazjap/SwiftNES"),
            carouselContent: CarouselContent(folderName: "raytracing", imageCount: 0, videoCount: 0)
        ),
        Project(
            name: "TrekPoint",
            language: "Swift",
            techStack: ["SwiftUI", "MapKit", "SwiftData", "CoreLocation", "BackgroundTasks"],
            description: "A build-your-own map app where you can mark places of interest, add a path by tapping to connect points, or record a path as you walk a trail using user's location.",
            website: nil,
            appstoreAccess: .testflight(URL(static: "https://testflight.apple.com/join/kBRCsNMm")),
            github: URL(static: "https://github.com/mazjap/TrekPoint"),
            carouselContent: CarouselContent(folderName: "trekpoint", imageCount: 3, videoCount: 2)
        ),
        Project(
            name: "Flask Master",
            language: "Swift",
            techStack: ["SwiftUI", "StoreKit", "UserDefaults"],
            description: "Flask Master is a 2D color sorting game built with accessibility (A11y) in mind. With voiceover, dynamicly colored backgrounds, and multiple difficulties, anyone can become a pro.",
            website: nil,
            appstoreAccess: .appstore(URL(static: "https://apps.apple.com/us/app/flask-master/id1632774294")),
            github: URL(static: "https://github.com/mazjap/FlaskGame"),
            carouselContent: CarouselContent(folderName: "flaskmaster", imageCount: 7, videoCount: 0)
        ),
        Project(
            name: "2D Ray Tracing",
            language: "Swift",
            techStack: ["SwiftUI", "UIKit"],
            description: "A ray tracer built in both UIKit and SwiftUI.",
            website: nil,
            appstoreAccess: nil,
            github: URL(static: "https://github.com/mazjap/2dRayTracing"),
            carouselContent: CarouselContent(folderName: "raytracing", imageCount: 5, videoCount: 1)
        ),
        Project(
            name: "fWords",
            language: "Swift",
            techStack: ["SwiftUI"],
            description: "Built a Wordle clone, because I like Wordle, and building my own versions of things.",
            website: nil,
            appstoreAccess: nil,
            github: nil,
            carouselContent: CarouselContent(folderName: "fwords", imageCount: 6, videoCount: 0)
        ),
        Project(
            name: "2048 Clone",
            language: "Swift",
            techStack: ["SwiftUI"],
            description: "Built a 2048 clone, because I like 2048 as well as building my own versions of things.",
            website: nil,
            appstoreAccess: nil,
            github: nil,
            carouselContent: CarouselContent(folderName: "2048", imageCount: 4, videoCount: 0)
        ),
        Project(
            name: "NeoMusic",
            language: "SwiftUI",
            techStack: ["SwiftUI", "MusicKit"],
            description: "A simple, but elegant music player with fun features and a design based in Neomorphism. Music is a passion of mine, so what better way to build my understanding of SwiftUI and custom components then making a music player.",
            website: nil,
            appstoreAccess: nil,
            github: URL(static: "https://github.com/mazjap/NeoMusic-SwiftUI"),
            carouselContent: CarouselContent(folderName: "neomusic", imageCount: 4, videoCount: 1)
        ),
        Project(
            name: "Settings Prototype",
            language: "Swift",
            techStack: ["SwiftUI"],
            description: "Built a static settings app clone to prove understanding of SwiftUI Lists, sections, forms, etc.",
            website: nil,
            appstoreAccess: nil,
            github: URL(static: "https://github.com/mazjap/SettingsPrototype"),
            carouselContent: CarouselContent(folderName: "settings", imageCount: 1, videoCount: 0)
        ),
        Project(
            name: "Community Calendar",
            language: "Swift",
            techStack: ["UIKit", "GraphQL", "Auth0", "CoreData"],
            description: """
Worked on a cross-functional, remote team of 12 developers to build an application that connects you with the events happening within a user's neighborhood. It possesses an intuitive search and filter feature and the ability to add any event to your calendar or get directions in maps.

On this project, I worked on the GraphQL implementation, maps, calendar, custom search and filtering, etc.
""",
            website: nil,
            appstoreAccess: nil,
            github: URL(static: "https://github.com/mazjap/community-calendar-ios"),
            carouselContent: CarouselContent(folderName: "communitycalendar", imageCount: 5, videoCount: 0)
        ),
        Project(
            name: "Habit Hacker",
            language: "Swift",
            techStack: ["UIKit", "CoreData", "CloudKit", "Local Notifications", "JTAppleCalendar"],
            description: """
Habit Hacker was built by myself and one other developer over the course of one week. It is an app that reminds users to complete tasks with enough repetition to become a habit. Sends daily notifications and uses a calendar and pie chart to track progress.

On this project, I implemented CloudKit, as well as Local Notifications, the JTAppleCalendar framework, and a custom navigation bar.
""",
            website: nil,
            appstoreAccess: .appstore(URL(static: "https://apps.apple.com/us/app/habit-hacker/id1510059622")),
            github: URL(static: "https://github.com/mazjap/HabitTracker-iOS"),
            carouselContent: CarouselContent(folderName: "habithacker", imageCount: 6, videoCount: 0)
        ),
        Project(
            name: "Pokédex",
            language: "Objective-C",
            techStack: ["UIKit", "UserDefaults", "URLSession"],
            description: "A pokédex to catalog and learn more about all of the Pokémon users find. This solo project was made to practice mixing Objective-C and Swift, while incorporating something that I have enjoyed for years, Pokémon.",
            website: nil,
            appstoreAccess: nil,
            github: URL(static: "https://github.com/mazjap/Pokedex"),
            carouselContent: CarouselContent(folderName: "pokedex", imageCount: 4, videoCount: 0)
        )
    ]
}
