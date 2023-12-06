//
//  SignupView.swift
//  Messenger
//
//  Created by Mert Durkaya on 4.12.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("messenger")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            VStack(spacing: 12) {
                TextField("Enter your email", text: $viewModel.email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal, 24)
                              
                TextField("Enter your fullname", text: $viewModel.fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal, 24)
                
                SecureField("Enter your password", text: $viewModel.password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal, 24)
            }
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding(.vertical)
            
            Spacer()
            Divider()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
