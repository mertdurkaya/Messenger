//
//  Route.swift
//  Messenger
//
//  Created by Mert Durkaya on 21.12.2023.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
