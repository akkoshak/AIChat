//
//  ChatRowCellView.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/13/25.
//

import SwiftUI

struct ChatRowCellView: View {
    var imageName: String? = Constants.randomImageURL
    var headline: String? = "Alpha"
    var subheadline: String? = "This is the last message in the chat."
    var hasNewChat = true
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(.secondary.opacity(0.5))
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                }
                
                if let subheadline {
                    Text(subheadline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewChat {
                Text("NEW")
                    .badgeButton()
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        List {
            ChatRowCellView()
                .removeListRowFormatting()
            
            ChatRowCellView(hasNewChat: false)
                .removeListRowFormatting()
            
            ChatRowCellView(imageName: nil)
                .removeListRowFormatting()
            
            ChatRowCellView(headline: nil, hasNewChat: false)
                .removeListRowFormatting()
            
            ChatRowCellView(subheadline: nil, hasNewChat: false)
                .removeListRowFormatting()
        }
    }
}
