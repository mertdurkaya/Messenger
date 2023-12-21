//
//  ActiveNowViewModel.swift
//  Messenger
//
//  Created by Mert Durkaya on 21.12.2023.
//

import Foundation
import Firebase

class ActiveNowViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers(limit: 5)
        self.users = users.filter({ $0.id != currentUid })
    }
}
