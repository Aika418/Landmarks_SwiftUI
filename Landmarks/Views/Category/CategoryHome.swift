//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/17.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        //アプリ内に階層的なナビゲーション構造を構築
        NavigationSplitView {
            List {
                modelData.features[0].image
                       .resizable()
                       .scaledToFill()
                       .frame(height: 200)
                       .clipped()
                //コンテンツがディスプレイの端まで拡張できるように
                       .listRowInsets(EdgeInsets())
                
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
             .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
    .environment(ModelData())
}
