//
//  InboxView.swift
//  Messenger
//
//  Created by Mert Durkaya on 4.12.2023.
//

import SwiftUI

struct InboxView: View {
    @State private var showMessageView = false
    @State private var user = User.MOCK_USER
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ActiveNowView()
                
                List {
                    ForEach(0 ... 10, id:\.self) { message in
                        InboxRowView()
                    }
                }
                .listStyle(.plain)
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
                
            })
            .fullScreenCover(isPresented: $showMessageView, content: {
                NewMessageView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
