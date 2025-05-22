//
//  AnyNotificationListenerViewModifier.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 5/22/25.
//

import Foundation
import SwiftUI

struct AnyNotificationListenerViewModifier: ViewModifier {
    let notificationName: Notification.Name
    let onNotificationReceived: @MainActor (Notification) -> Void
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: notificationName)) { notification in
                onNotificationReceived(notification)
            }
    }
}

extension View {
    
    func onNotificationReceived(name: Notification.Name, action: @MainActor @escaping (Notification) -> Void) -> some View {
        modifier(AnyNotificationListenerViewModifier(notificationName: name, onNotificationReceived: action))
    }
}
