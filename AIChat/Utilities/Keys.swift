//
//  Keys.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/2/25.
//

import Foundation

struct Keys {
    static let openAI: String = {
        do {
            return try KeysConfiguration.value(for: "API_KEY")
        } catch {
            print("Failed to load API key: \(error)")
            return ""
        }
    }()
}
