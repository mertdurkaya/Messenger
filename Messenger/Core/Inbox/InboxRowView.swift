//
//  InboxRowView.swift
//  Messenger
//
//  Created by Mert Durkaya on 5.12.2023.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: User.MOCK_USER, size: .medium)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Heath Ledger")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Some message Some message Some message Some message Some message Some message")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)
            
        }
        .frame(height: 72)
    }
    
}

#Preview {
    InboxRowView()
}
