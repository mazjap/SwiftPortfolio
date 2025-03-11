import struct Foundation.URL

public enum ImageResource {
    case bootstrap(name: String)
    case local(path: String)
    case remote(url: URL)
}
