//
//  ProfileView.swift
//  Editor
//
//  Created by Язгуль Хасаншина on 07.05.2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        VStack {
            
            Button {
                Task {
                    try viewModel.signOutFromProfile()
                }

            } label: {
                Text("Sign out")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()

    }
}

#Preview {
    ProfileView()
}
