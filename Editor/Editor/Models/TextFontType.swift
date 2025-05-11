import SwiftUI

enum TextFontType: String, CaseIterable, Identifiable {
    case body
    case title
    case largeTitle
    case caption

    var id: String { self.rawValue }

    var displayName: String {
        switch self {
        case .body: return "Body"
        case .title: return "Title"
        case .largeTitle: return "LargeTitle"
        case .caption: return "Caption"
        }
    }
    var font: Font {
        switch self {
        case .body: return .body
        case .title: return .title
        case .largeTitle: return .largeTitle
        case .caption: return .caption
        }
    }
}
