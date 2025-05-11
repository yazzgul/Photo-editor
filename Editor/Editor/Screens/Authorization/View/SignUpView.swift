
import SwiftUI

struct SignUpView: View {

    @StateObject private var viewModel = SignUpEmailViewModel()

    var body: some View {
        NavigationStack {
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
                viewModel.signUp()
            } label: {
                Text("Sign up with Email")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
        .alert("Error", isPresented: $viewModel.showSignUpEmptyErrorSheet) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.showSignUpEmptyErrorText)
        }
        .alert("Error", isPresented: $viewModel.showSignUpFirebaseErrorSheet) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Something bad happened")
        }
        .padding()
        .navigationTitle("Sign Up with Email")
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
