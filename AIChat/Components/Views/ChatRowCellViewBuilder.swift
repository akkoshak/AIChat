//
//  ChatRowCellViewBuilder.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/13/25.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    var currentUserId: String? = ""
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    @State private var didLoadAvatar = false
    @State private var didLoadChatMessage = false
    
    private var isLoading: Bool {
        !(didLoadAvatar && didLoadChatMessage)
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        return lastChatMessage.hasBeenSeenBy(userId: currentUserId)
    }
    
    private var subheadline: String? {
        if isLoading {
            return "..."
        }
        
        if avatar == nil && lastChatMessage == nil {
            return "Error - Fail to load data."
        }
        
        return lastChatMessage?.content
    }
    
    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "Loading..." : avatar?.name,
            subheadline: subheadline,
            hasNewChat: isLoading ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            lastChatMessage = await getLastChatMessage()
            didLoadChatMessage = true
        }
    }
}

#Preview {
    VStack {
        ChatRowCellViewBuilder(chat: .mock) {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        } getLastChatMessage: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        }
        
        ChatRowCellViewBuilder(chat: .mock) {
            .mock
        } getLastChatMessage: {
            .mock
        }
        
        ChatRowCellViewBuilder(chat: .mock) {
            nil
        } getLastChatMessage: {
            nil
        }
    }
}
