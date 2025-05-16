//
//  ContentView.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

//プレビューを更新してモデル オブジェクトを環境に追加
#Preview {
    ContentView()
        .environment(ModelData())
}
