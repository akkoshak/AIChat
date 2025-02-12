//
//  ChatReportModel.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/13/25.
//

import IdentifiableByString
import SwiftUI

struct ChatReportModel: Codable, StringIdentifiable {
    let id: String
    let chatId: String
    let userId: String
    let isActive: Bool
    let dateCreated: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case chatId = "chat_id"
        case userId = "user_id"
        case isActive = "is_active"
        case dateCreated = "date_created"
    }
    
    static func new(chatId: String, userId: String) -> Self {
        ChatReportModel(
            id: UUID().uuidString,
            chatId: chatId,
            userId: userId,
            isActive: true,
            dateCreated: .now
        )
    }
}
