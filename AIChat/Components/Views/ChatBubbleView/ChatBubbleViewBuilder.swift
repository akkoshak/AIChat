//
//  ChatBubbleViewBuilder.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/16/25.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?
    
    var body: some View {
        ChatBubbleView(
            text: message.content ?? "",
            textColor: isCurrentUser ? .white : .primary,
            backgroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray6),
            showImage: !isCurrentUser,
            imageName: imageName
        )
        .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        .padding(isCurrentUser ? .leading : .trailing, 75)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            ChatBubbleViewBuilder()
            
            ChatBubbleViewBuilder(isCurrentUser: true)
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "This is a chat bubble with a lot of text that wraps to multiple lines and it keeps on going. This is a chat bubble with a lot of text that wraps to multiple lines and it keeps on going.",
                    seenByIds: nil,
                    dateCreated: .now
                )
            )
            
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "This is a chat bubble with a lot of text that wraps to multiple lines and it keeps on going. This is a chat bubble with a lot of text that wraps to multiple lines and it keeps on going.",
                    seenByIds: nil,
                    dateCreated: .now
                ),
                isCurrentUser: true
            )
        }
        .padding(12)
    }
}
