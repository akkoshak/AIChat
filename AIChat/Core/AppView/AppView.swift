//
//  AppView.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/3/25.
//

import SwiftUI

struct AppView: View {
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
    @Environment(LogManager.self) private var logManager
    
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
        .task {
            await checkUserStatus()
        }
        .onAppear {
            logManager.identifyUser(userId: "abc123", name: "Abdulkarim", email: "test@example.com")
            logManager.addUserProperties(dict: UserModel.mock.eventParameters)
            
            logManager.trackEvent(event: Event.alpha)
            logManager.trackEvent(event: Event.beta)
            logManager.trackEvent(event: Event.gamma)
            logManager.trackEvent(event: Event.delta)
        }
        .onChange(of: appState.showTabBar) { _, showTabBar in
            if !showTabBar {
                Task {
                    await checkUserStatus()
                }
            }
        }
    }
    
    enum Event: LoggableEvent {
        case alpha, beta, gamma, delta
        
        var eventName: String {
            switch self {
            case .alpha:
                return "Event_Alpha"
            case .beta:
                return "Event_Beta"
            case .gamma:
                return "Event_Gamma"
            case .delta:
                return "Event_Delta"
            }
        }
        
        var parameters: [String: Any]? {
            switch self {
            case .alpha, .beta:
                return [
                    "aaa": true,
                    "bbb": 123
                ]
            default:
                return nil
            }
        }
        
        var type: LogType {
            switch self {
            case .alpha:
                return .info
            case .beta:
                return .analytic
            case .gamma:
                return .warning
            case .delta:
                return .severe
            }
        }
    }
    
    private func checkUserStatus() async {
        if let user = authManager.auth {
            do {
                try await userManager.login(auth: user, isNewUser: false)
            } catch {
                print("Failed to login to auth for existing user: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserStatus()
            }
        } else {
            do {
                let result = try await authManager.signInAnonymously()
                print("Sign in anonymous success: \(result.user.uid)")
                try await userManager.login(auth: result.user, isNewUser: result.isNewUser)
            } catch {
                print("Failed to sign in anonymously and login: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserStatus()
            }
        }
    }
}

#Preview("AppView - TabBar") {
    AppView(appState: AppState(showTabBar: true))
        .environment(UserManager(services: MockUserServices(user: .mock)))
        .environment(AuthManager(service: MockAuthService(user: .mock())))
}

#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
        .environment(UserManager(services: MockUserServices(user: nil)))
        .environment(AuthManager(service: MockAuthService(user: nil)))
}
