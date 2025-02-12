//
//  MockLocalAvatarPersistence.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/4/25.
//

@MainActor
struct MockLocalAvatarPersistence: LocalAvatarPersistence {
    let avatars: [AvatarModel]
    
    init(avatars: [AvatarModel] = AvatarModel.mocks) {
        self.avatars = avatars
    }
    
    func addRecentAvatar(avatar: AvatarModel) throws {
        
    }
    
    func getRecentAvatars() throws -> [AvatarModel] {
        avatars
    }
}
