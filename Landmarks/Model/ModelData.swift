//
//  ModelData.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import Foundation

@Observable
class ModelData {
    //landmarkData.jsonから初期化するランドマークの配列を作成
    var landmarks: [Landmark] = load("landmarkData.json")
    //hikes配列をモデルにロード
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default
    
    var features: [Landmark] {
            landmarks.filter { $0.isFeatured }
        }
    
    //カテゴリ名をキーとして、各キーに関連付けられたランドマークの配列を持つ計算された辞書を追加
    var categories: [String: [Landmark]] {
            Dictionary(
                grouping: landmarks,
                by: { $0.category.rawValue }
            )
        }
}


//引数で指定された名前のJSON データを取得するメソッド
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
