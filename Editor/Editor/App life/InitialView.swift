//
//  InitialView.swift
//  Editor
//
//  Created by Язгуль Хасаншина on 09.05.2025.
//

import SwiftUI

struct InitialView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {

        Group {
            if !isLoggedIn {
                NavigationStack {
                    StartView()
                }

            } else {
                TabView {
                    NavigationStack {
                        MainScreenView()
                    }
                    .tabItem {
                        Label("Редактор", systemImage: "house")
                    }
                    NavigationStack {
                        ProfileView()
                    }
                    .tabItem {
                        Label("Профиль", systemImage: "person")
                    }

                }
            }
            
        }
        .onAppear() {
            let authUser = try? AuthManager.shared.getAuthenticatedUser()
            isLoggedIn = authUser != nil ? true : false
        }

    }

}

#Preview {
    InitialView()
}
