//
//  AvatarManager.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/3/25.
//

import SwiftUI

protocol AvatarService: Sendable {
    func createAvatar(avatar: AvatarModel, image: UIImage) async throws
}

struct MockAvatarService: AvatarService {
    
    func createAvatar(avatar: AvatarModel, image: UIImage) async throws {
        
    }
    
}

import FirebaseFirestore
import SwiftfulFirestore

struct FirebaseAvatarService: AvatarService {
    var collection: CollectionReference {
        Firestore.firestore().collection("avatars")
    }
    
    func createAvatar(avatar: AvatarModel, image: UIImage) async throws {
        // Upload the image
        let path = "avatars/\(avatar.avatarId)"
        let url = try await FirebaseImageUploadService().uploadImage(image: image, path: path)
        
        // Update avatar image name
        var avatar = avatar
        avatar.updateProfileImage(imageName: url.absoluteString)
        
        // Upload the avatar
        try collection.document(avatar.avatarId).setData(from: avatar, merge: true)
    }
    
}

@MainActor
@Observable class AvatarManager {
    private let service: AvatarService
    
    init(service: AvatarService) {
        self.service = service
    }
    
    func createAvatar(avatar: AvatarModel, image: UIImage) async throws {
        try await service.createAvatar(avatar: avatar, image: image)
    }
}
