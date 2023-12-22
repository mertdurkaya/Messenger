//
//  ChatView.swift
//  Messenger
//
//  Created by Mert Durkaya on 6.12.2023.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CircularProfileImageView(user: user, size: .xLarge)
                }
                .padding(.vertical)
                
                LazyVStack {
                    ForEach(viewModel.messages) { message in
                        ChatMessageCell(message: message)
                    }
                }
            }
            
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Text here", text: $viewModel.messageText, axis: .vertical)
                    .padding(16)
                    .padding(.trailing, 48)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    withAnimation {
                        viewModel.sendMessage()
                        viewModel.messageText = ""
                    }
                } label: {
                    if viewModel.messageText == "" {
                        Text("Send")
                            .fontWeight(.semibold)
                            .animation(.easeInOut, value: viewModel.messageText == "")
                    } else {
                        Image(systemName: "chevron.forward.2")
                            .font(.title3)
                    }
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
