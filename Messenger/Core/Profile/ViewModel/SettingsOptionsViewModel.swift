//
//  SettingsOptionsViewModel.swift
//  Messenger
//
//  Created by Mert Durkaya on 5.12.2023.
//

import Foundation
import SwiftUI

enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notification
    
    var title: String {
        switch self {
        case .darkMode: return "Dark mode"
        case .activeStatus: return "Active Status"
        case .accessibility: return "Accessibility"
        case .privacy: return "Privacy"
        case .notification: return "Notification"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .accessibility: return "person.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .notification: return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .darkMode: return .yellow
        case .activeStatus: return .green
        case .accessibility: return .red
        case .privacy: return .blue
        case .notification: return .purple
        }
    }
    
    var id: Int { return self.rawValue }
}
