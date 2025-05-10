
import SwiftUI
import Firebase
import GoogleSignIn
import GoogleSignInSwift

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()

    var body: some View {
        VStack {
            VStack {
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()

            Button {
               viewModel.signIn()
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            NavigationLink {
                SignUpView()
            } label: {
                Text("Sign Up with Email ->")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .wide, state: .normal)) {
                viewModel.signInWithGoogle()

            }
            Button("Forget password?") {
                viewModel.isPasswordRecoveryViewSheetPresented.toggle()
            }
            .sheet(isPresented: $viewModel.isPasswordRecoveryViewSheetPresented) {
                PasswordRecoveryView()
            }
            .navigationBarBackButtonHidden()
        }
        .padding()
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        SignInView()
    }
}
