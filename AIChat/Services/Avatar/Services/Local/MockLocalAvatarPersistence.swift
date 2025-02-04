//
//  MockLocalAvatarPersistence.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/4/25.
//

@MainActor
struct MockLocalAvatarPersistence: LocalAvatarPersistence {
    
    func addRecentAvatar(avatar: AvatarModel) throws {
        
    }
    
    func getRecentAvatars() throws -> [AvatarModel] {
        AvatarModel.mocks.shuffled()
    }
}
