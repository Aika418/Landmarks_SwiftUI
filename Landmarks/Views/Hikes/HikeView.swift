/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

//スタムトランジションを展開してもコードがクリーンな状態に保たれる
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        //ビューが表示されたときと消えたときの異なる遷移を実現
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
                )
    }
}


struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    //アニメーション化された遷移が追加
                    //4 秒間のbasicアニメーションを関数に渡す
                    withAnimation{
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                
                    //グラフが表示されているときにボタンを大きくする
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                    
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                //グラフはスライドして見えたり見えなくなったりして表示
                    .transition(.moveAndFade)
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
