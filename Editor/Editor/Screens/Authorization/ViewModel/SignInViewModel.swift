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

///    sign in with Email and Password
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
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
                print("Error in signInWithGoogle: \(error.localizedDescription)")
            }
        }
    }
        //                guard let topVC = Utility.shared.topViewController() else {
        //                    throw URLError(.badServerResponse)
        //                }
        //                let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        //
        //                guard let idToken = gidSignInResult.user.idToken?.tokenString else {
        //                    throw URLError(.badServerResponse)
        //                }
        //                let accessToken = gidSignInResult.user.accessToken.tokenString
        //
        //                let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)

}
