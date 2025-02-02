//
//  MockAIService.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/2/25.
//

import SwiftUI

struct MockAIService: AIService {
    
    func generateImage(input: String) async throws -> UIImage {
        try await Task.sleep(for: .seconds(3))
        return UIImage(systemName: "star.fill")!
    }
}
