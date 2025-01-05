//
//  TabBarView.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/5/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            // Explore
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "eyes")
                }
            
            // Chats
            ChatsView()
                .tabItem {
                    Label("Chats", systemImage: "bubble.left.and.bubble.right.fill")
                }
            
            // Profile
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
