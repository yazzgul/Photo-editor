//
//  SignInViewModel.swift
//  Editor
//
//  Created by Язгуль Хасаншина on 09.05.2025.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

@MainActor
final class SignInViewModel: ObservableObject {

    @AppStorage("isLoggedIn") private var isLoggedIn = false

    @Published var email = ""
    @Published var password = ""

    @Published var isPasswordRecoveryViewSheetPresented = false

    @Published var showSignInEmptyErrorSheet = false
    @Published var showSignInEmptyFirebaseErrorSheet = false

    var showSignInEmptyErrorText = "No email or password found"
    var showSignInEmptyFirebaseErrorText = ""

    @Published var showSignInWithGoogleErrorSheet = false
    var showSignInWithGoogleErrorText = ""


///    sign in with Email and Password
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            showSignInEmptyErrorSheet = true
            print("No email or password found")
            return
        }
        Task {
            do {
                let returnedUserData = try await AuthManager.shared.signIn(email: email, password: password)
                print("Success in sign in")
                print(returnedUserData)
                isLoggedIn = true

            } catch {
//                showSignInEmptyFirebaseErrorSheet = true
//                showSignInEmptyFirebaseErrorText = error.localizedDescription
                print("Error: \(error.localizedDescription)" )

            }
        }
    }

    func signInWithGoogle() {
        Task {
            do {
                let tokens = try await GoogleAuthHelperManager.shared.signIn()
                try await AuthManager.shared.signInWithGoogle(tokens: tokens)
                isLoggedIn = true
            } catch {
                showSignInWithGoogleErrorSheet = true
                print("Error in signInWithGoogle: \(error.localizedDescription)")
            }
        }
    }

}
