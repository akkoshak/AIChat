//
//  WelcomeView.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/5/25.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(AppState.self) private var root
    @Environment(LogManager.self) private var logManager
    
    @State var imageName = Constants.randomImageURL
    @State private var showSignInView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                    .padding(.top, 24)
                
                ctaButtons
                    .padding(16)
                
                policyLinks
            }
        }
        .screenAppearAnalytics(name: "WelcomeView")
        .sheet(isPresented: $showSignInView) {
            CreateAccountView(
                title: "Sign In",
                subtitle: "Connect to an existing account.",
                onDidSignIn: { isNewUser in
                    handleDidSignIn(isNewUser: isNewUser)
                }
            )
            .presentationDetents([.medium])
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("AI Chat 🤖")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("YouTube @ SwiftfulThinking")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
    
    private var ctaButtons: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started!")
                    .callToActionButton()
            }
            
            Text("Already have an account? Sign in!")
                .underline()
                .font(.body)
                .padding()
                .tappableBackground()
                .onTapGesture {
                    onSignInPressed()
                }
        }
    }
    
    enum Event: LoggableEvent {
        case didSignIn(isNewUser: Bool)
        case signInPressed
        
        var eventName: String {
            switch self {
            case .didSignIn:          return "WelcomeView_DidSignIn"
            case .signInPressed:      return "WelcomeView_SignIn_Pressed"
            }
        }
        
        var parameters: [String: Any]? {
            switch self {
            case .didSignIn(isNewUser: let isNewUser):
                return [
                    "is_new_user": isNewUser
                ]
            default:
                return nil
            }
        }
        
        var type: LogType {
            switch self {
            default:
                return .analytic
            }
        }
    }
    
    private func handleDidSignIn(isNewUser: Bool) {
        logManager.trackEvent(event: Event.didSignIn(isNewUser: isNewUser))
        
        if isNewUser {
            
        } else {
            root.updateViewState(showTabBar: true)
        }
    }
    
    private func onSignInPressed() {
        showSignInView = true
        logManager.trackEvent(event: Event.signInPressed)
    }
    
    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.termsOfServiceURL)!) {
                Text("Terms of Service")
            }
            
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            
            Link(destination: URL(string: Constants.privacyPolicyURL)!) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environment(AppState())
}
