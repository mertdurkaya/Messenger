//
//  User.swift
//  Messenger
//
//  Created by Mert Durkaya on 5.12.2023.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = UUID()
    let fullname: String
    let email: String
    var profileImageUrl: String?
}

extension User {
    static let MOCK_USER = User(fullname: "Bruce Wayne", email: "batman@gmail.com", profileImageUrl: "batman")
}
