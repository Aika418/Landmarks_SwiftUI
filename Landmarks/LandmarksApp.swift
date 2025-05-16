//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/16.
//

import SwiftUI

//アプリのエントリポイントを識別
@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        //表示用のコンテンツを提供
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
