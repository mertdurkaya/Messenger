//
//  NewMessageViewModel.swift
//  Messenger
//
//  Created by Mert Durkaya on 6.12.2023.
//

import Firebase
import Foundation

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText: String = ""
    
    var filteredUsers: [User] {
        guard !searchText.isEmpty else { return users }
        return users.filter { user in
            user.fullname.lowercased().contains(searchText.lowercased())
        }
    }
    
    init() {
        Task { try await fetchUsers() }
    }
    
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter({ $0.id != currentUid })
    }
}
