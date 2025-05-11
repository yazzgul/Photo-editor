import SwiftUI

struct MainPhotoEffectButtonView: View {
    let label: String

    var body: some View {
        HStack {
            Text(label)
        }
        .font(.headline)
        .padding()
        .frame(height: 40)
        .background(Color.white)
        .foregroundStyle(.blue)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.blue, lineWidth: 2)
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))

    }
}

#Preview {
    MainPhotoEffectButtonView(label: "Effect")
}

