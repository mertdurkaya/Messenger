//
//  LoginView.swift
//  Messenger
//
//  Created by Mert Durkaya on 4.12.2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        @State var email = ""
        @State var password = ""
        
        NavigationStack {
            VStack {
                Spacer()
                // logo image
                
                Image("messenger")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                
                // text fields
                
                VStack(spacing: 12) {
                    TextField("Enter your email", text: $email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.horizontal, 24)
                    
                    SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.horizontal, 24)
                }
                
                // password
            
                Button {
                    print("Forgot password tapped")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .bold()
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                // login
                
                Button {
                    print("login tapped")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 44)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundStyle(.gray)
                
                HStack {
                    Image("facebook")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .bold()
                        .foregroundStyle(.blue)
                }
                .padding()
                
                Spacer()
                
                // sign up link
                
                Divider()
                
                NavigationLink {
                    Text("Sign up View")
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}
