import SwiftUI

//с помощью модального окна
//Предусмотреть валидацию введенных данных (например, проверка формата email и минимальной длины пароля).

struct PasswordRecoveryView: View {
    @StateObject private var viewModel = PasswordRecoveryViewModel()

    var body: some View {
        VStack {
            Text("Forget password? Let`s reset it!")
                .font(.headline)
                .foregroundStyle(.black)

            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Button {
                Task {
                    await viewModel.recoverPassword()
                }
            } label: {
                Text("Reset password")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

        }
        .padding()
        .alert(isPresented: $viewModel.showCheckEmailAlert) {
            Alert(
                title: Text("Уведомление"),
                message: Text(viewModel.checkEmailAlertMessage),
                dismissButton: .default(Text("OK"))
            )

        }
        
    }
}

#Preview {
    PasswordRecoveryView()
}
