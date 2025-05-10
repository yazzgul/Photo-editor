//
//  SignInViewModel.swift
//  Editor
//
//  Created by Язгуль Хасаншина on 09.05.2025.
//

import SwiftUI

@MainActor
final class SignUpEmailViewModel: ObservableObject {

    @AppStorage("isLoggedIn") private var isLoggedIn = false

    @Published var email = ""
    @Published var password = ""

    func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        Task {
            do {
                let returnedUserData = try await AuthManager.shared.createUser(email: email, password: password)
                print("Success in sign up")
                print(returnedUserData)
                isLoggedIn = true

            } catch {
                print("Error: \(error.localizedDescription)" )

            }
        }
    }

}

