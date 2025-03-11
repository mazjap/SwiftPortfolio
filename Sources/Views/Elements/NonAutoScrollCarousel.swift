@testable import Ignite

struct NonAutoScrollCarousel: HTML {
    var body: some HTML {
        Section {
            if slides.count > 1 {
                Section {
                    ForEach(0..<slides.count) { index in
                        Button()
                        .data("bs-target", "#\(carouselID)")
                        .data("bs-slide-to", String(index))
                        .class(index == 0 ? "active" : nil)
                        .aria(.current, index == 0 ? "true" : nil)
                        .aria(.label, "Slide \(index + 1)")
                    }
                }
                .style(InlineStyle("background", value: "#00000033"))
                .margin(.bottom, .px(48))
                .class("carousel-indicators")
            }
            
            Section {
                ForEach(slides.enumerated()) { index, item in
                    item.assigned(at: index)
                }
            }
            .class("carousel-inner")
            
            if slides.count > 1 {
                Button {
                    Image("/images/chevronLeft.png", description: "Previous slide")
                        .imageFit(.fit, anchor: .center)
                    
                    Span("Previous")
                        .class("visually-hidden")
                }
                .class("carousel-control-prev")
                .data("bs-target", "#\(carouselID)")
                .data("bs-slide", "prev")
                .margin(.vertical, .px(48))
                
                Button {
                    Image("/images/chevronRight.png", description: "Next slide")
                        .imageFit(.fit, anchor: .center)
                    
                    Span("Next")
                        .class("visually-hidden")
                }
                .class("carousel-control-next")
                .data("bs-target", "#\(carouselID)")
                .data("bs-slide", "next")
                .margin(.vertical, .px(48))
            }
        }
        .attributes(attributes)
        .id(carouselID)
        .class("carousel", "slide", style == .crossfade ? "carousel-fade" : nil)
    }
    var attributes = CoreAttributes()
    let isPrimitive = true
    let carouselID = "carousel\(UUID().uuidString.truncatedHash)"
    let slides: [Slide]
    var style = Carousel.CarouselStyle.move
    
    init(_ slides: () -> [Slide]) {
        self.slides = slides()
    }
    
    func carouselStyle(_ style: Carousel.CarouselStyle) -> Self {
        var copy = self
        copy.style = style
        return copy
    }
}

enum BackgroundProvider {
    case image(ImageResource)
    case video(VideoResource)
    case color(Color)
}

/// One slide in a `Carousel`.
struct Slide: HTML {
    /// The content and behavior of this HTML.
    public var body: some HTML { self }

    /// The standard set of control attributes for HTML elements.
    public var attributes = CoreAttributes()

    /// Whether this HTML belongs to the framework.
    public var isPrimitive: Bool { true }

    /// An optional background image to use for this slide. This should be
    /// specified relative to the root of your site, e.g. /images/dog.jpg.
    var background: BackgroundProvider?

    /// Other items to display inside this slide.
    var items: HTMLCollection

    /// How opaque the background image should be. Use values lower than 1.0
    /// to progressively dim the background image.
    var backgroundOpacity = 1.0

    /// Creates a new `Slide` object using a background image.
    /// - Parameter background: An optional background image to use for
    /// this slide. This should be specified relative to the root of your
    /// site, e.g. /images/dog.jpg.
    public init(background: BackgroundProvider) {
        self.background = background
        self.items = HTMLCollection([])
    }

    /// Creates a new `Slide` object using a background image and a page
    /// element builder that returns an array of `HTML` objects to use
    /// inside the slide.
    /// - Parameter background: An optional background image to use for
    /// this slide. This should be specified relative to the root of your
    /// site, e.g. /images/dog.jpg.
    /// - Parameter items: Other items to place inside this slide, which will
    /// be placed on top of the background image.
    public init(background: BackgroundProvider? = nil, @HTMLBuilder items: () -> some HTML) {
        self.background = background
        self.items = HTMLCollection(items)
    }

    /// Adjusts the opacity of the background image for this slide. Use values
    /// lower than 1.0 to progressively dim the background image.
    /// - Parameter opacity: The new opacity for this slide.
    /// - Returns: A new `Slide` instance with the updated background opacity.
    public func backgroundOpacity(_ opacity: Double) -> Slide {
        var copy = self
        copy.backgroundOpacity = opacity
        return copy
    }

    /// Used during rendering to assign this carousel slide to a particular parent,
    /// so our open paging behavior works correctly.
    func assigned(at index: Int) -> String {
        Section {
            if let background {
                Group {
                    switch background {
                    case .color(let color):
                        Section {}.background(color)
                    case .image(.bootstrap(let name)):
                        Image(systemName: name, description: "")
                    case .image(.local(let path)):
                        Image(path, description: "")
                    case .image(.remote(let url)):
                        Image(url.absoluteString, description: "")
                    case .video(.local(let path)):
                        Video(path)
                    case .video(.remote(let url)):
                        Video(url.absoluteString)
                    }
                }
                .class("d-block", "w-100")
                .style(
                    .init(.height, value: "100%"),
                    .init(.objectFit, value: "cover"),
                    .init(.opacity, value: backgroundOpacity.formatted(.nonLocalizedDecimal))
                )
            }

            Section {
                Section {
                    render()
                }
                .class("carousel-caption")
                .margin(.bottom, .px(48))
            }
            .class("container")
        }
        .class("carousel-item")
        .class(index == 0 ? "active" : nil)
        .render()
    }

    /// Renders this element using publishing context passed in.
    /// - Returns: The HTML for this element.
    public func render() -> String {
        items.map { $0.render() }.joined()
    }
}
