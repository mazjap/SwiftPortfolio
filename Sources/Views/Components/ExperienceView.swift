import Ignite

struct ExperienceView: HTML {
    private let experience: Experience
    
    init(experience: Experience) {
        self.experience = experience
    }
    
    var body: some HTML {
        Section {
            Text(experience.jobTitle)
                .font(.title3)
            
            Text(experience.company)
            
            Text(experience.duration)
                .font(.system(.body, size: .px(12), weight: .semibold))
                .foregroundStyle(.black)
                .padding(.vertical, .small)
            
            ForEach(experience.formattedDescription) { descriptionPart in
                Text(descriptionPart)
            }
            
            if let website = experience.website {
                Text {
                    Link("Website", target: website)
                        .target(.blank)
                        .relationship(.noOpener, .noReferrer)
                }
                .margin(.top, .small)
            }
        }
        .class("experience-card")
    }
}
