//
//  RegistrationViewModel.swift
//  Messenger
//
//  Created by Mert Durkaya on 6.12.2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService().createUser(withEmail: email, password: password, fullname: fullname)
    }
}
