import SwiftUI
import PencilKit

struct MainCanvasDrawingView: View {
    
    @State private var canvasView = PKCanvasView()
    @Binding var signatureImage: UIImage?

    var body: some View {
        VStack {
            PKCanvasRepresentation(canvasView: $canvasView, backgroundImage: signatureImage!)
                .frame(height: 250)
                .border(Color.blue, width: 1)
        }
        .padding()
        HStack {
            Button("Clear") {
                canvasView.drawing = PKDrawing()
            }
            Spacer()

            Button("Save draw") {
                if let image = signatureImage {
                    signatureImage = canvasView.asImage(over: image)
                }
            }
        }
        .padding()

    }
}

#Preview {
    MainCanvasDrawingView(signatureImage: .constant(UIImage(named: "cat")))
}


