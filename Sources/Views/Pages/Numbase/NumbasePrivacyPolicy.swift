import Ignite

struct NumbasePrivacyPolicy: StaticLayout {
    let path = "numbase/privacy-policy"
    let title = "Numbase Privacy Policy"
    
    var body: some HTML {
        Header(title: "Numbase", subtitle: "Privacy Policy - Last updated: January 15th, 2025")
        
        VStack {
            Text("Overview")
                .font(.title3)
            
            Text("Numbase is committed to protecting your privacy. This privacy policy explains that Numbase does not collect, use, or share any personal information.")
                .margin(.bottom, .large)
            
            Text("Data Collection")
                .font(.title3)
                .margin(.bottom, .small)
            
            Text("Numbase does not:")
                .font(.title5)
            
            List {
                Text("Collect any personal information")
                Text("Store any user data")
                Text("Use analytics or tracking")
                Text("Require internet connectivity")
                Text("Access any system resources beyond basic app functionality")
            }
            .margin(.bottom, .large)
            
            Text("Data Storage")
                .font(.title5)
            
            Text("All calculations and conversions are performed locally on your device. No data is stored or transmitted.")
                .margin(.bottom, .large)
            
            Text("Changes to This Policy")
                .font(.title5)
            
            Text("If we make changes to this privacy policy, we will post the updated version here.")
                .margin(.bottom, .large)
            
            Text("Contact")
                .font(.title5)
            
            Span {
                "If you have questions about this privacy policy, you can contact us at "
                
                Link("jordan.c4922@gmail.com", target: "mailto:jordan.c4922@gmail.com")
                    .target(.blank)
                    .relationship(.noOpener, .noReferrer)
                
                "."
            }
        }
        .margin(40)
    }
}
