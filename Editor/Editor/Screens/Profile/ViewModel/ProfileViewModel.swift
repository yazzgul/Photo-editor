

import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    func signOutFromProfile() throws {
        do {
            try AuthManager.shared.signOut()
            print("Succes in signOut")
            isLoggedIn = false

        } catch {
            print("Error in signOut: \(error.localizedDescription)")
        }

    }
}
