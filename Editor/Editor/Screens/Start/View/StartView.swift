import SwiftUI

struct StartView: View {

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 12) {
                Text("EDITOR")
                    .font(.system(size: 48, weight: .semibold))
                    .tracking(4)
                    .foregroundStyle(.primary)

                Text("Редактор для твоих фото")
                    .font(.title3)
                    .foregroundStyle(.gray)
            }
            .multilineTextAlignment(.center)
            .padding()

            Spacer()

            NavigationLink(destination: SignInView()) {
                Text("Войти")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(16)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
            }

        }

    }

}

#Preview {
    NavigationStack {
        StartView()
    }
}
