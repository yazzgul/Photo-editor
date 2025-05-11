import SwiftUI

// для кругов 
enum PhotoEffect: String, CaseIterable  {
    case noir
    case tonal
    case chrome
    case transfer
    case sepia
    case clear

    var effectColor: Color {
        switch self {
        case .noir:
            return Color.black
        case .tonal:
            return Color.gray
        case .chrome:
            return Color.blue
        case .transfer:
            return Color.purple
        case .sepia:
            return Color.brown
        case .clear:
            return Color.gray.opacity(0.5)
        }
    }
    
}
