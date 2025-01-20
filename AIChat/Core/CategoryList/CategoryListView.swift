//
//  CategoryListView.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 1/21/25.
//

import SwiftUI

struct CategoryListView: View {
    var category: CharacterOption = .alien
    var imageName: String = Constants.randomImageURL
    
    @State private var avatars: [AvatarModel] = AvatarModel.mocks
    
    var body: some View {
        List {
            CategoryCellView(
                title: category.plural.capitalized,
                imageName: imageName,
                font: .largeTitle,
                cornerRadius: 0
            )
            .removeListRowFormatting()
            
            ForEach(avatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .removeListRowFormatting()
            }
        }
        .ignoresSafeArea()
        .listStyle(PlainListStyle())
    }
}

#Preview {
    CategoryListView()
}
