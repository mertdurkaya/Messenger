//
//  UserService.swift
//  Messenger
//
//  Created by Mert Durkaya on 6.12.2023.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: Current user in service is \(String(describing: currentUser))")
    }
}
