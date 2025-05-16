//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import SwiftUI


struct LandmarkDetail: View {
    //環境のモデル データへのアクセス
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
        }
    
    var body: some View {
        @Bindable var modelData = modelData
        //alignment：デフォルトだと中央に配置されるから先端で揃える
        ScrollView  {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                      .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                 }

                HStack {
                    Text(landmark.park)
                    //サイズが内容によってのみ定義されるのではなく
                    //それを含むビューが親ビューのすべてのスペースを使用するように拡張
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            //ランドマークの名前と詳細の外縁の周りにもう少しスペースを確保
            .padding()
        }
        //詳細ビューを表示するときにナビゲーションバーにタイトルを付ける修飾子
        .navigationTitle(landmark.name)
        //タイトルをインラインで表示する修飾子
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    let modelData = ModelData()
        return LandmarkDetail(landmark: modelData.landmarks[0])
            .environment(modelData)
}
