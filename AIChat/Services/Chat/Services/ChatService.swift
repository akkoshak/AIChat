//
//  ChatService.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/13/25.
//

protocol ChatService: Sendable {
    func createNewChat(chat: ChatModel) async throws
    func getChat(userId: String, avatarId: String) async throws -> ChatModel?
    func getAllChats(userId: String) async throws -> [ChatModel]
    func addChatMessage(chatId: String, message: ChatMessageModel) async throws
    func getLastChatMessage(chatId: String) async throws -> ChatMessageModel?
    func streamChatMessages(chatId: String) -> AsyncThrowingStream<[ChatMessageModel], Error>
    func deleteChat(chatId: String) async throws
    func deleteAllChatsForUser(userId: String) async throws
    func reportChat(report: ChatReportModel) async throws
}
