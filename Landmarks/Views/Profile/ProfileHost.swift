//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/17.
//プロファイル情報の静的な概要ビューと編集モードの両方が表示

import SwiftUI


struct ProfileHost: View {
    //プロパティラッパーを使って環境に組み込まれた値にアクセスし、編集スコープを読み書きする
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default


    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                //キャンセルボタンを追加
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                //環境の値のオンとオフを切り替える編集ボタンを作成
                Spacer()
                EditButton()
            }
            //静的プロファイルまたは編集モードのビューのいずれかを表示する
            if editMode?.wrappedValue == .inactive {
                            ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                // [完了] ボタンをタップしたときに永続プロファイルを更新
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}


#Preview {
    ProfileHost()
        .environment(ModelData())
}
