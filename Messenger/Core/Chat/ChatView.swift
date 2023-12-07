//
//  ChatView.swift
//  Messenger
//
//  Created by Mert Durkaya on 6.12.2023.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    let user: User
    
    var body: some View {
        VStack {
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
            
            ScrollView {
                ForEach(0 ... 15, id: \.self) { message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }
            }
            
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Message", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    print("send message")
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
