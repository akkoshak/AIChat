//
//  DevSettingsView.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 2/18/25.
//

import SwiftUI

struct DevSettingsView: View {
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                authSection
                userSection
                deviceSection
            }
            .navigationTitle("Dev Settings 🔧")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButtonView
                }
            }
            .screenAppearAnalytics(name: "DevSettings")
        }
    }
    
    private var backButtonView: some View {
        Image(systemName: "xmark")
            .font(.title2)
            .fontWeight(.black)
            .anyButton {
                onBackButtonPressed()
            }
    }
    
    private func onBackButtonPressed() {
        dismiss()
    }
    
    private var authSection: some View {
        Section {
            let array = authManager.auth?.eventParameters.asAlphabeticalArray ?? []
            
            ForEach(array, id: \.key) { item in
                itemRow(item: item)
            }
        } header: {
            Text("Auth Info")
        }
    }
    
    private var userSection: some View {
        Section {
            let array = userManager.currentUser?.eventParameters.asAlphabeticalArray ?? []
            
            ForEach(array, id: \.key) { item in
                itemRow(item: item)
            }
        } header: {
            Text("User Info")
        }
    }
    
    private var deviceSection: some View {
        Section {
            let array = Utilities.eventParameters.asAlphabeticalArray
            
            ForEach(array, id: \.key) { item in
                itemRow(item: item)
            }
        } header: {
            Text("Device Info")
        }
    }
    
    private func itemRow(item: (key: String, value: Any)) -> some View {
        HStack {
            Text(item.key)
            
            Spacer(minLength: 4)
            
            if let value = String.convertToString(item.value) {
                Text(value)
            } else {
                Text("N/A")
            }
        }
        .font(.caption)
        .lineLimit(1)
        .minimumScaleFactor(0.3)
    }
}

#Preview {
    DevSettingsView()
        .previewEnvironment()
}
