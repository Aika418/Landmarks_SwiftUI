//
//  Landmark.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import Foundation
import SwiftUI
import CoreLocation

//ファイル内のいくつかのキーの名前と一致するいくつかのプロパティを持つ構造を定義
//idIdentifiable：データを読み取るときにデコードするためのプロパティを追加する
struct Landmark: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    //データから画像の名前を読み取るプロパティ
    private var imageName: String
    //アセットカタログから画像を読み込む計算プロパティ
    var image: Image {
        Image(imageName)
    }
    //JSON データ構造内のストレージを反映
    private var coordinates: Coordinates
    //MapKit フレームワークとのやり取りに役立つプロパティ
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
