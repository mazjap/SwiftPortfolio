// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftPortfolio",
    platforms: [.macOS(.v13)],
    dependencies: [.package(url: "https://github.com/twostraws/Ignite.git", branch: "main")],
    targets: [.executableTarget(name: "SwiftPortfolio", dependencies: ["Ignite"])],
    swiftLanguageModes: [.v6]
)
