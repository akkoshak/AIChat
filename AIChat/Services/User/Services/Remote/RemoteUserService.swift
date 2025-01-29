//
//  RemoteUserService.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/29/25.
//

import Foundation

protocol RemoteUserService: Sendable {
    func saveUser(user: UserModel) async throws
    func markOnboardingCompleted(userId: String, profileColorHex: String) async throws
    func streamUser(userId: String) -> AsyncThrowingStream<UserModel, Error>
    func deleteUser(userId: String) async throws
}
