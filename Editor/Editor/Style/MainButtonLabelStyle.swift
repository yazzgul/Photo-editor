import SwiftUI

struct MainButtonLabelStyle: View {
    let symbolName: String
    let label: String

    var body: some View {
        HStack {
            Image(systemName: symbolName)
            Text(label)

        }
        .font(.headline)
        .padding()
        .frame(height: 40)
        .background(Color.blue)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))

    }
}

#Preview {
    MainButtonLabelStyle(symbolName: "camera", label: "Камера")
}
