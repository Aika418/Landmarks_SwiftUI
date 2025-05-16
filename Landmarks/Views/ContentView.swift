//
//  ContentView.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import SwiftUI


struct ContentView: View {
    //タブ選択の状態変数を追加し、デフォルト値を指定
    @State private var selection: Tab = .featured

    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

//プレビューを更新してモデル オブジェクトを環境に追加
#Preview {
    ContentView()
        .environment(ModelData())
}
