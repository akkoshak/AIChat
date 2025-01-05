//
//  AppView.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/3/25.
//

import SwiftUI

struct AppView: View {
    @State var appState: AppState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabBar: {
                TabBarView()
            },
            onboarding: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("AppView - TabBar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
