import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some HTML {
        // Required only if you need to add extra functionality, like analytics:
        // HTML { }
        
        Head {
            MetaLink(href: "/css/main.css", rel: .stylesheet)
            MetaLink(href: "/css/experience.css", rel: .stylesheet)
            MetaLink(href: "/css/projects.css", rel: .stylesheet)
            MetaLink(href: "/css/education.css", rel: .stylesheet)
            MetaLink(href: "/css/console.css", rel: .stylesheet)
        }
        
        Body {
            content
            
            Contact()
            
            Footer()
            
            Console()
        }
        .ignorePageGutters()
    }
}
