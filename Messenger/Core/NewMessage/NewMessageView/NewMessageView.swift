//
//  NewMessageView.swift
//  Messenger
//
//  Created by Mert Durkaya on 5.12.2023.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To:", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACT")
                    .foregroundStyle(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach(viewModel.users) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: user, size: .medium)
                            
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading, 40)
                    }
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.primary)
                }
        }
        }
    }
}

#Preview {
    NewMessageView(selectedUser: .constant(User.MOCK_USER))
}
