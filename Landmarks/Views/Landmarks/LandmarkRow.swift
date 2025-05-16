//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            //お気に入りかどうかで星の画像
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    //ランドマークパラメータを初期化子に追加し、配列の最初の要素を指定
    //コンテンツをグループ化する
    return Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
}
