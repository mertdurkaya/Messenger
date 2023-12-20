//
//  ChatViewModel.swift
//  Messenger
//
//  Created by Mert Durkaya on 20.12.2023.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
