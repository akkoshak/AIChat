//
//  LocalUserPersistence.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/29/25.
//

import Foundation

protocol LocalUserPersistence {
    func getCurrentUser() -> UserModel?
    func saveCurrentUser(user: UserModel?) throws
}
