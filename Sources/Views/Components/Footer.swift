import Ignite
import Foundation

struct Footer: HTML {
    @Environment(\.site) private var site
    @Environment(\.page) private var page
    
    // Only updates when site is recompiled
    private var thisYear: Int {
        Calendar.current.component(.year, from: .now)
    }
    
    var body: some HTML {
        Section {
            Text("© 2019-\(thisYear) Jordan Christensen")
                .horizontalAlignment(.center)
                .foregroundStyle(.white)
                .padding(.top, .large)
            
            Text {
                "Written in Swift, generated with "
                Link("Ignite", target: URL(static: "https://github.com/twostraws/Ignite"))
                    .target(.blank)
                    .relationship(.noOpener, .noReferrer)
            }
            .horizontalAlignment(.center)
            .foregroundStyle(.white)
            .font(.system(size: .px(10), weight: .bold))
            .padding(.bottom, .xSmall)
        }
        .padding(.bottom, .large)
        .background(Color(white: 0.2))
    }
}
