import Foundation
import Ignite

struct Home: StaticLayout {
    static let title: String = "Home"
    let title: String
    
    init() {
        self.title = Self.title
    }
    
    var body: some HTML {
        Header(subtitle: "Welcome to my website")
        
        experience
        
        divider
        
        projects
        
        divider
        
        skills
        
        divider
        
        education
    }
    
    private var experience: some HTML {
        Section("Experience") {
            ForEach(Experience.all) { experience in
                ExperienceView(experience: experience)
            }
        }
        .id("experience")
        .class("section experience-section")
    }
    
    private var projects: some HTML {
        Section("Projects") {
            Section {
                ForEach(Project.all) { project in
                    ProjectView(project: project)
                }
            }
            .class("projects-container")
            
            Text("This is just a taste of the projects I've done. There are many others that I plan to add here soon, other that I need to finish, and others still that I want to make. Check back again to see what I've been working on.")
                .foregroundStyle(.init(white: 0.66))
        }
        .id("projects")
        .class("section projects-section")
    }
    
    private var skills: some HTML {
        Section("Skills") {
            Section {
                let skills = Skills.all.ordered
                
                ForEach(skills) { skill in
                    Text(skill)
                        .foregroundStyle(.black)
                    
                    if skill != skills.last {
                        Text("&#x2022")
                            .frame(width: 20)
                            .foregroundStyle(.black)
                    }
                }
            }
            .style(.display, "flex")
            .style(.flexDirection, "row")
            .style(.flexWrap, "wrap")
            .frame(alignment: .center)
        }
    }
    
    private var education: some HTML {
        Section("Education") {
            ForEach(Education.all) { education in
                EducationView(education: education)
            }
        }
        .id("education")
        .class("section education-section")
    }
    
    private var divider: some HTML {
        Divider()
            .margin(.bottom, .rem(3))
    }
}
