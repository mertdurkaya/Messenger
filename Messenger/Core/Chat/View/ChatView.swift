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
                    VStack(spacing: 4) {
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }
                
                
                ForEach(viewModel.messages) { message in
                    ChatMessageCell(message: message)
                }
            }
            
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Message", text: $viewModel.messageText, axis: .vertical)
                    .padding(16)
                    .padding(.trailing, 48)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
