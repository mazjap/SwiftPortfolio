import Ignite
import struct Foundation.TimeZone

struct Portfolio: Site {
    let name = "Jordan Christensen"
    let titleSuffix = " – Portfolio"
    let author = "Jordan Christensen"
    let description: String? = "My portfolio website for iOS Development. A collection of my open source projects, personal projects, and blog posts."
    let url = URL(static: "https://www.jordan-christensen.com")
    
    let language: Language = .english
    let timeZone: TimeZone? = .init(identifier: "MST")
    
    let useDefaultBootstrapURLs: BootstrapOptions = .localBootstrap
    let builtInIconsEnabled: BootstrapOptions = .none
    
    let syntaxHighlighterConfiguration: SyntaxHighlighterConfiguration = .automatic
    let prettifyHTML = false
    
    let homePage = Home()
    let layout = MainLayout()
    let favicon: URL? = URL(static: "/images/favicon.ico")
    
    // TODO: - Enable RSS feed
    var feedConfiguration: FeedConfiguration? = .none
    
    var lightTheme: (any Theme)? = nil
    var darkTheme: (any Theme)? = nil
    
    // TODO: - Add robots.txt
//    var robotsConfiguration: RobotsType
    
    // TODO: - Add tag layout when adding blog posts
//    var tagLayout: TagPageLayout
    
    var staticLayouts: [any StaticLayout] = [
        NumbasePrivacyPolicy(),
        NumbaseSupport()
    ]
//
//    /// An array of all the content layouts you want to include in your site.
//    @ArticleLayoutBuilder var articleLayouts: [any ArticleLayout] { get }
}

