import Foundation
import FirebaseAuth

// firebase user model
/// Модель для пользователя из Firebase
struct AuthDataResultModel {
    let uid: String
    let email: String?

    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}
