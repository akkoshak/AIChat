//
//  ChatMessageModel.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/13/25.
//

import Foundation

struct ChatMessageModel: Identifiable {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenBy(userId: String) -> Bool {
        guard let seenByIds else { return false }
        return seenByIds.contains(userId)
    }
    
    static var mock: ChatMessageModel {
        mocks[0]
    }
    
    static var mocks: [ChatMessageModel] {
        let now = Date()
        return [
            ChatMessageModel(
                id: "msg1",
                chatId: "1",
                authorId: "user1",
                content: "Hello, world!",
                seenByIds: ["user2", "user3"],
                dateCreated: now
            ),
            ChatMessageModel(
                id: "msg2",
                chatId: "2",
                authorId: "user2",
                content: "Hi there!",
                seenByIds: ["user1"],
                dateCreated: now.addingTimeInterval(minutes: -5)
            ),
            ChatMessageModel(
                id: "msg3",
                chatId: "3",
                authorId: "user3",
                content: "Good morning!",
                seenByIds: ["user1", "user2", "user4"],
                dateCreated: now.addingTimeInterval(hours: -1)
            ),
            ChatMessageModel(
                id: "msg4",
                chatId: "1",
                authorId: "user4",
                content: "How's it going?",
                seenByIds: nil,
                dateCreated: now.addingTimeInterval(hours: -2, minutes: -15)
            )
        ]
    }
}
