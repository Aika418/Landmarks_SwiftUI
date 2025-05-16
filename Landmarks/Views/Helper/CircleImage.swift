//
//  CircleImage.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())//円のクリッピングシェイプを適用
        //画像に境界線をつける
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 7) //半径7ポイントの影を追加
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
