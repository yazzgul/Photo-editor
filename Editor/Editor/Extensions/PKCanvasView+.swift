import Foundation
import PencilKit

extension PKCanvasView {
    func asImage(over background: UIImage) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { context in
            background.draw(in: bounds)
            drawing.image(from: bounds, scale: 1.0).draw(in: bounds)
        }
    }
}
