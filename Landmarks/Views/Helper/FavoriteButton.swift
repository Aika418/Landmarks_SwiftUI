//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import SwiftUI

struct FavoriteButton: View {
    //データを格納するプロパティと、データを表示および変更するビューの間で読み書きを行う
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            //ボタンのラベルに指定したタイトル文字列は UI に表示されない
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
                }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
