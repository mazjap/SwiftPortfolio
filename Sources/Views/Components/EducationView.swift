import Ignite

struct EducationView: HTML {
    private let education: Education
    
    init(education: Education) {
        self.education = education
    }
    
    var body: some HTML {
        Section {
            Text(education.program)
                .font(.title3)
            
            Text(education.institution)
            
            Text(education.duration)
            
            if let website = education.website {
                Link("Learn More", target: website.absoluteString)
                    .target(.blank)
                    .relationship(.noOpener, .noReferrer)
            }
        }
        .class("education-card")
    }
}
