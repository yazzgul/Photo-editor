import SwiftUI

struct UserOverlayText: Identifiable {
    let id = UUID()
    var text: String
    var fontName: String
    var fontSize: CGFloat
    var color: Color
    var offset: CGSize
}
