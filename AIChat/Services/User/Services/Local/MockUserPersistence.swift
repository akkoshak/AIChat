//
//  MockUserPersistence.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/29/25.
//

import Foundation

struct MockUserPersistence: LocalUserPersistence {
    let currentUser: UserModel?
    
    init(user: UserModel? = nil) {
        self.currentUser = user
    }
    
    func getCurrentUser() -> UserModel? {
        currentUser
    }
    
    func saveCurrentUser(user: UserModel?) throws {
        
    }
    
}
