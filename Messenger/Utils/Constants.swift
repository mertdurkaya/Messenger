//
//  Constants.swift
//  Messenger
//
//  Created by Mert Durkaya on 21.12.2023.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
