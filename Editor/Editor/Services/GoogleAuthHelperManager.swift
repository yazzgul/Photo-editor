import Foundation
import GoogleSignIn
import GoogleSignInSwift

final class GoogleAuthHelperManager {

    static let shared = GoogleAuthHelperManager()

    private init () {}

    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let topVC = Utility.shared.topViewController() else {
            throw URLError(.badServerResponse)
        }
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)

        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString

        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)

        return tokens
    }
}
