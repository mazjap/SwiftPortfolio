import Ignite

struct ProjectView: HTML {
    private let project: Project
    
    init(project: Project) {
        self.project = project
    }
    
    var body: some HTML {
        Section {
            NonAutoScrollCarousel {
                if project.carouselContent.isEmpty {
                    [Slide(background: .color(Color(white: 0.965))) { Text("No Visuals, yet") }]
                } else {
                    project.carouselContent.iterableImages.map { path in
                        Slide(background: .image(.local(path: path)))
                    } + project.carouselContent.iterableVideos.map { path in
                        Slide(background: .video(.local(path: path)))
                    }
                }
            }.padding(.horizontal, 10)
            
            Text(project.language)
                .font(.system(size: 16))
                .margin(0)
            
            Text(project.name)
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.black)
                .margin(0)
            
            Text(project.techStack.joined(separator: ", "))
                .font(.system(size: 12))
                .margin(.bottom, .medium)
            
            ForEach(project.formattedDescription) { descriptionPart in
                Text(descriptionPart)
            }
            
            if project.hasLinks {
                HStack(spacing: 10) {
                    if let github = project.github {
                        Link("Github", target: github.absoluteString)
                            .target(.blank)
                            .relationship(.noOpener, .noReferrer)
                        
                        Spacer()
                    }
                    
                    if case let .appstore(url) = project.appstoreAccess {
                        Link("App Store", target: url.absoluteString)
                            .target(.blank)
                            .relationship(.noOpener, .noReferrer)
                        
                        Spacer()
                    } else if case let .testflight(url) = project.appstoreAccess {
                        Link("TestFlight", target: url.absoluteString)
                            .target(.blank)
                            .relationship(.noOpener, .noReferrer)
                        
                        Spacer()
                    }
                    
                    if let website = project.website {
                        Link("Website", target: website.absoluteString)
                            .target(.blank)
                            .relationship(.noOpener, .noReferrer)
                        
                        Spacer()
                    }
                }
            }
        }
        .background(Color(white: 0.965))
        .class("project-card")
        
//            <span style={{ color: '#999' }}>{project.language}</span>
//            <h3>{project.title}</h3>
//            <span style={{ fontSize: '10px'}}>{project.techStack}</span>
    }
}
