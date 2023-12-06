//
//  InboxViewModel.swift
//  Messenger
//
//  Created by Mert Durkaya on 6.12.2023.
//

import Combine
import Firebase
import Foundation

class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
