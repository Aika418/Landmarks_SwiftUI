//
//  MapView.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import SwiftUI
//Map地図のレンダリング
import MapKit

struct MapView: View {
    //固定座標を渡す
    var coordinate: CLLocationCoordinate2D
    var body: some View {
        //マップの初期化子を値が変更されたときに更新されるように、
        //位置入力を受け取るものに変更
        Map(position: .constant(.region(region)))
    }
    //マップの地域情報を保持するプライベート計算変数を作成
    private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
