//
//  ChatsView.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/5/25.
//

import SwiftUI

struct ChatsView: View {
    @State private var chats: [ChatModel] = ChatModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    Text(chat.id)
                }
            }
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatsView()
}
