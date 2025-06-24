import Ignite

struct FlaskMasterPrivacyPolicy: StaticLayout {
    let path = "flask-master/privacy-policy"
    let title = "Flask Master Privacy Policy"
    
    var body: some HTML {
        Header(title: "Flask Master", subtitle: "Privacy Policy - Last updated: June 23rd, 2025")
        
        VStack {
            Text("Introduction")
                .font(.title3)
            
            Text(#"This Privacy Policy describes how Flask Master ("we," "our," or "us") collects, uses, and shares information when you use our mobile application Flask Master (the "App"). We are committed to protecting your privacy and being transparent about our data practices."#)
                .margin(.bottom, .large)
            
            informationWeCollect
                .margin(.bottom, .large)
            
            informationYouProvide
                .margin(.bottom, .large)
            
            howWeUseInformation
                .margin(.bottom, .large)
            
            informationSharing
                .margin(.bottom, .large)
            
            dataSecurity
                .margin(.bottom, .large)
            
            yourChoicesAndRights
                .margin(.bottom, .large)
            
            childrensPrivacy
                .margin(.bottom, .large)
            
            changesToThisPolicy
                .margin(.bottom, .large)
            
            internationalUsers
                .margin(.bottom, .large)
            
            dataRetention
                .margin(.bottom, .large)
            
            contactUs
        }
        .margin(40)
    }
    
    @HTMLBuilder
    private var informationWeCollect: some HTML {
        Text("Information We Collect")
            .font(.title3)
            .margin(.bottom, .small)
        
        Text("Information Collected Automatically")
            .font(.title5)
        
        Text("When you use Flask Master, we automatically collect certain information through third-party advertising services:")
        
        List {
            Text("Device identifiers and advertising IDs")
            Text("IP address (used to estimate general geographic location)")
            Text("Device information (device type, operating system, app version)")
            Text("Usage and interaction data with advertisements")
            Text("App performance data (launch times, crash reports, energy usage)")
            Text("Diagnostic information for improving ad services")
        }
    }
    
    @HTMLBuilder
    private var informationYouProvide: some HTML {
        Text("Information You Provide")
            .font(.title5)
        
        Text("Flask Master is designed to work entirely offline. We do not collect, store, or transmit any personal information that you enter into the app, including:")
            .margin(.bottom, .large)
        
        List {
            Text("Game progress and scores")
            Text("Settings and preferences")
            Text("Any user-generated content")
        }
        
        Text("All game data remains stored locally on your device.")
    }
    
    @HTMLBuilder
    private var howWeUseInformation: some HTML {
        Text("How We Use Information")
            .font(.title5)
        
        Text("The information collected through advertising services is used for:")
        
        List {
            Text("Displaying relevant advertisements")
            Text("Fraud prevention and security")
            Text("Analytics to improve ad performance")
            Text("Improving the overall user experience")
            Text("Generating revenue to support the free app")
        }
        
        Text("We do not use collected information for any other purposes.")
    }
    
    @HTMLBuilder
    private var informationSharing: some HTML {
        Text("Information Sharing")
            .font(.title5)
        
        Text("We do not sell, trade, or otherwise transfer your personal information to third parties, except:")
        
        Text("With Advertising Partners:")
        
        List {
            Text("Google AdMob and its advertising partners may collect and use information as described in their privacy policies")
            Text("Third-party advertising networks may place and read cookies or use web beacons to collect information for advertising purposes")
            Text("These partners may combine information collected from our app with information from other sources")
        }
        
        Text("Legal Requirements:")
        
        List {
            Text("We may disclose information if required by law, regulation, or legal process")
            Text("To protect our rights, property, or safety, or that of our users or others")
        }
    }
    
    @HTMLBuilder
    private var dataSecurity: some HTML {
        Text("Data Security")
            .font(.title5)
        
        Text("All information transmitted through our advertising services is encrypted using Transport Layer Security (TLS) protocol. Since Flask Master stores all game data locally on your device, you maintain control over your personal game information.")
    }
    
    @HTMLBuilder
    private var yourChoicesAndRights: some HTML {
        Text("Your Choices and Rights")
            .font(.title5)
        
        Text("Advertising Controls")
            .font(.title6)
        
        List {
            Text(#"iOS Users: You can limit ad tracking by going to Settings > Privacy & Security > Apple Advertising and turning on "Limit Ad Tracking""#)
            Text("Android Users: You can reset your advertising ID or opt out of personalized ads in Settings > Privacy > Ads")
        }
        
        Text("California Privacy Rights (CCPA)")
            .font(.title6)
        
        Text("If you are a California resident, you have the right to:")
        
        List {
            Text("Know what personal information is collected about you")
            Text("Request deletion of your personal information")
            Text("Opt-out of the sale of your personal information (Note: We do not sell personal information)")
            Text("Non-discrimination for exercising your privacy rights")
        }
        
        Text("Other US State Privacy Rights")
            .font(.title6)
        
        Text("Similar rights may be available to residents of Virginia, Colorado, Connecticut, and other states with comprehensive privacy laws. Contact us using the information below to exercise these rights.")
        
        Text("Canadian Privacy Rights (PIPEDA)")
            .font(.title6)
        
        Text("Canadian users have rights to access and correct their personal information. Since our app stores data locally, you maintain direct control over your information.")
    }
    
    @HTMLBuilder
    private var childrensPrivacy: some HTML {
        Text("Children's Privacy")
            .font(.title5)
        
        Text("Flask Master does not knowingly collect personal information from children under 13 years of age. If we become aware that we have collected personal information from a child under 13, we will take steps to delete such information promptly.")
        Text("For users under 13, we recommend that parents or guardians review this privacy policy and contact us with any questions.")
    }
    
    @HTMLBuilder
    private var internationalUsers: some HTML {
        Text("International Users")
            .font(.title5)
        
        Text("Flask Master is available worldwide (except in the European Union). If you are using our app from outside the United States, please note that information collected through advertising services may be transferred to and processed in the United States, which may have different privacy laws than your country of residence.")
    }
    
    @HTMLBuilder
    private var dataRetention: some HTML {
        Text("Data Retention")
            .font(.title5)
        
        List {
            Text("Information collected through advertising services is retained according to Google AdMob's data retention policies")
            Text("Game data stored locally on your device is retained until you delete the app or clear its data")
            Text("We do not store any user data on our servers")
        }
    }
    
    @HTMLBuilder
    private var thirdPartyServices: some HTML {
        Text("Third-Party Services")
            .font(.title5)
        
        Text("Flask Master uses the following third-party services:")
        
        Text {
            "Google AdMob: For displaying advertisements. Please review "
            
            Link("Google's Privacy Policy", target: "https://policies.google.com/privacy")
            
            "for information about how Google collects and uses information."
        }
    }
    
    @HTMLBuilder
    private var changesToThisPolicy: some HTML {
        Text("Changes to This Policy")
            .font(.title5)
        
        Text("If we make changes to this privacy policy, we will post the updated version here.")
    }
    
    @HTMLBuilder
    private var contactUs: some HTML {
        Text("Contact")
            .font(.title5)
        
        Span {
            "If you have questions about this privacy policy, you can contact us at "
            
            Link("jordan.c4922@gmail.com", target: "mailto:jordan.c4922@gmail.com")
                .target(.blank)
                .relationship(.noOpener, .noReferrer)
            
            "."
        }
        
        Text("For users in California or other states with specific privacy laws, you may also use the above contact information to exercise your privacy rights.")
    }
}

