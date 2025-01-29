//
//  FileManagerUserPersistence.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/29/25.
//

import SwiftUI

struct FileManagerUserPersistence: LocalUserPersistence {
    private let userDocumentKey = "current_user"
    
    func getCurrentUser() -> UserModel? {
        try? FileManager.getDocument(key: userDocumentKey)
    }
    
    func saveCurrentUser(user: UserModel?) throws {
        try FileManager.saveDocument(key: userDocumentKey, value: user)
    }
    
}
