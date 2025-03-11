import Ignite
import struct Foundation.URL

struct SocialLink {
    private let imageResource: ImageResource
    private let imageDescription: String?
    let url: URL
    
    @MainActor
    var image: Image {
        switch imageResource {
        case let .bootstrap(name): Image(systemName: name, description: imageDescription)
        case let .local(path): Image(path, description: imageDescription)
        case let .remote(url): Image(url.absoluteString, description: imageDescription)
        }
    }
}

extension SocialLink {
    // TODO: - Remove this initializer once bootstrap is removed
    init(systemImage: String, description: String? = nil, linkTo url: URL) {
        self.init(imageResource: .bootstrap(name: systemImage), imageDescription: description, url: url)
    }
    
    init(imagePath: String, description: String? = nil, linkTo url: URL) {
        self.init(imageResource: .local(path: imagePath), imageDescription: description, url: url)
    }
    
    init(imageURL: URL, description: String? = nil, linkTo url: URL) {
        self.init(imageResource: .remote(url: url), imageDescription: description, url: url)
    }
}
