import Ignite
import Foundation

@main
struct PortfolioPublisher {
    static func main() async {
        let publishable = Portfolio()
        
        do {
            try await publishable.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}
