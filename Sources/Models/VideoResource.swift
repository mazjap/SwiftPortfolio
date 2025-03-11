import struct Foundation.URL

enum VideoResource {
    case local(path: String)
    case remote(url: URL)
}
