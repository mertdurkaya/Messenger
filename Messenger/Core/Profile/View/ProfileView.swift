//
//  ProfileView.swift
//  Messenger
//
//  Created by Mert Durkaya on 5.12.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    @State private var showLogoutAlert = false
    let user: User
    
    var body: some View {
        VStack {
            VStack {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: user, size: .xLarge)
                    }
                }
                
                Text(user.fullname)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.headline)
                        }
                    }
                }
                
                Section {
                    Button("Log Out") {
                        showLogoutAlert.toggle()
                    }
                    
                    Button("Delete Account") {
                        
                    }
                }
                .foregroundStyle(.red)
            }
        }
        .alert(isPresented: $showLogoutAlert) {
            Alert(title: Text("Log Out"), message: Text("Are you sure you want to log out?"), primaryButton: .destructive(Text("Log Out"), action: {
                withAnimation(.easeOut) {
                    AuthService.shared.signOut()
                }
            }), secondaryButton: .cancel())
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER)
}
