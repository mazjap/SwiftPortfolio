import struct Foundation.Date
import struct Foundation.URL

struct Education: FormattableDuration {
    let program: String
    let institution: String
    let startDate: Date
    let endDate: Date?
    let website: URL?
}

extension Education {
    static let all = [
        Education(
            program: "Web Programming & Development Certification",
            institution: "Mountainland Technical College",
            startDate: try! Date(portfolioDateString: "2021-01-11"),
            endDate: try! Date(portfolioDateString: "2021-10-22"),
            website: URL(static: "https://mtec.edu/programs/web-programming-and-development/")
        ),
        Education(
            program: "iOS Development Certification",
            institution: "Bloom Institute of Technology (formerly Lambda School)",
            startDate: try! Date(portfolioDateString: "2019-08-12"),
            endDate: try! Date(portfolioDateString: "2020-05-19"),
            website: URL(static: "https://www.bloomtech.com/")
        ),
        Education(
            program: "AP Computer Science",
            institution: "Shanghai American School (上海美国学校)",
            startDate: try! Date(portfolioDateString: "2017-08-07"),
            endDate: try! Date(portfolioDateString: "2018-06-15"),
            website: URL(static: "https://www.saschina.org")
        )
    ]
}
