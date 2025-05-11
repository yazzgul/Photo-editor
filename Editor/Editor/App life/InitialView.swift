import SwiftUI

struct InitialView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

//    @StateObject var vm = ViewModel()

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
//        .environmentObject(vm)
        .onAppear() {
            UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")

            let authUser = try? AuthManager.shared.getAuthenticatedUser()
            isLoggedIn = authUser != nil ? true : false
        }

    }

}

#Preview {
    InitialView()
}
