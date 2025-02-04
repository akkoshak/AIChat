//
//  LocalAvatarPersistence.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/4/25.
//

@MainActor
protocol LocalAvatarPersistence {
    func addRecentAvatar(avatar: AvatarModel) throws
    func getRecentAvatars() throws -> [AvatarModel]
}
