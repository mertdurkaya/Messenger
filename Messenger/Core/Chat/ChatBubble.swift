//
//  ChatBubble.swift
//  Messenger
//
//  Created by Mert Durkaya on 6.12.2023.
//

import SwiftUI

struct ChatBubble: Shape {
    let isFromCurrenUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [
                                    UIRectCorner.topLeft,
                                    UIRectCorner.topRight,
                                    isFromCurrenUser ? .bottomLeft : .bottomRight
                                ],
                                cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble(isFromCurrenUser: true)
}
