import Ignite

struct Header: HTML {
    @Environment(\.site) private var site
    @Environment(\.page) private var page
    
    private var providedTitle: String?
    private var providedSubtitle: String?
    private var subnote: String?
    
    private var subtitle: String {
        providedSubtitle ?? page.title
    }
    
    private var title: String {
        providedTitle ?? site.name
    }
    
    init(title: String? = nil, subtitle: String? = nil) {
        self.providedTitle = title
        self.providedSubtitle = subtitle
    }
    
    var body: some HTML {
        Section {
            Text(title)
                .horizontalAlignment(.center)
                .font(.system(.title1, size: .rem(2.5), weight: .semibold))
            
            Text(subtitle)
                .horizontalAlignment(.center)
        }
        .padding(.vertical, 60)
        .background(Color(white: 0.95))
    }
}
