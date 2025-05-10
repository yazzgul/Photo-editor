
import Foundation

@MainActor
final class PasswordRecoveryViewModel: ObservableObject {

    @Published var email = ""
    @Published var showCheckEmailAlert = false
    var checkEmailAlertMessage = ""

    func recoverPassword() async {
        if email.isEmpty {
            print("No email found")
        }
        do {
            try await AuthManager.shared.resetPassword(email: email)
            
            print("Success in password recovery")
            checkEmailAlertMessage = "Проверьте почту для восстановления пароля"
            showCheckEmailAlert = true


        } catch {
            print("Error: \(error.localizedDescription)" )
//            checkEmailAlertMessage = "Ошибка: \(error.localizedDescription)"
            checkEmailAlertMessage = "Ошибка"
            showCheckEmailAlert = true
        }

    }

    
}
