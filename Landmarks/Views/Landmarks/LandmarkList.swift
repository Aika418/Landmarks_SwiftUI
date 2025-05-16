//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import SwiftUI

struct LandmarkList: View {
    //状態プロパティは固有の情報を保持するために使用するため、
    //常に状態を privateとして作成します
    
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    //プロパティと各値をチェックして、ランドマークリストのフィルターされたバージョンを計算
    var filteredLandmarks: [Landmark] {
        //ランドマークをフィルタリングする際のデータ
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    
    var body: some View {
        NavigationSplitView {
        //モデルデータのlandmarks配列を初期化子に渡す
        //Landmark要素のコレクションを直接使用できる
            //リストのフィルターされたバージョンを使用
            List {
                Toggle(isOn: $showFavoritesOnly) {
                                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        //現在のランドマークを目的地まで通過
                        LandmarkDetail(landmark: landmark)                } label: {
                            //配列内の要素ごとに一つリストが作成される
                            LandmarkRow(landmark: landmark)
                        }
                }
            }
            //ナビゲーション バーのタイトルを設定
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}
