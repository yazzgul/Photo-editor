import SwiftUI
import PencilKit

struct PKCanvasRepresentation: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    var backgroundImage: UIImage

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 1)
        canvasView.drawingPolicy = .anyInput
        canvasView.backgroundColor = .clear

        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = canvasView.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        canvasView.insertSubview(imageView, at: 0)

        return canvasView
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {

    }

}
