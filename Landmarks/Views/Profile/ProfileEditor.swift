//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 塩入愛佳 on 2025/05/17.
//
import SwiftUI


struct ProfileEditor: View {
    @Binding var profile: Profile
    //目標日を変更
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            //通知を受信するためのユーザーの設定に対応するトグルを追加
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            //Pickerコントロールとそのラベルを配置
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
        }
    }
}


#Preview {
    ProfileEditor(profile: .constant(.default))
}
