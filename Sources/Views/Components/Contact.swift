import Foundation
@testable import Ignite

struct Contact: HTML {
    private let socials = [
        SocialLink(imagePath: "/images/social/github.svg", description: "Github", linkTo: URL(string: "https://github.com/mazjap")!),
        SocialLink(imagePath: "/images/social/linkedin.svg", description: "LinkedIn", linkTo: URL(string: "https://www.linkedin.com/in/jordan-a-christensen/")!)
    ]
    
    var body: some HTML {
        VStack {
            Text("Get in Touch")
                .horizontalAlignment(.center)
                .font(.system(.title1, weight: .black))
                .padding(.bottom, .xLarge)
            
            Link(
                Text("jordan.c4922@gmail.com")
                    .horizontalAlignment(.center),
                target: "mailto:jordan.c4922@gmail.com"
            )
            .target(.blank)
            .role(.secondary)
            .relationship(.noOpener, .noReferrer)
            .padding(.bottom, .xLarge)
            
            let size = LengthUnit.rem(2)
            
            HStack(spacing: 10) {
                ForEach(socials) { social in
                    Link(target: social.url.absoluteString) {
                        social.image
                            // Annoyingly, Ignite automatically adds a min(size, 100%) to
                            // width when using (r)em. This causes some issues for containers
                            // where the size is determined by it's children.
                            // Using .custom fixes this issue
                            .frame(width: .custom("\(size)"), height: size)
                    }
                    .target(.blank)
                    .role(.secondary)
                    .relationship(.noOpener, .noReferrer)
                }
            }
            .frame(height: size, alignment: .center)
            .padding(.bottom, .xLarge)
        }
        .padding(.top, .large)
        .background(Color(white: 0.95))
    }
}

extension Percentage: @retroactive ExpressibleByFloatLiteral, @retroactive ExpressibleByIntegerLiteral {
    public init(floatLiteral value: Double) {
        self.init(value)
    }
    
    public init(integerLiteral value: Int) {
        self.init(floatLiteral: Double(value))
    }
}
