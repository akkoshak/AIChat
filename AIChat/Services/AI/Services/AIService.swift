//
//  AIService.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/2/25.
//

import SwiftUI

protocol AIService: Sendable {
    func generateImage(input: String) async throws -> UIImage
    func generateText(chats: [AIChatModel]) async throws -> AIChatModel
}
