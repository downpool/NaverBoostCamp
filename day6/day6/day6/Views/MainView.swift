import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var page = 1
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("메인 화면").font(.title).bold()
                Spacer()
                Button("광고") { viewModel.showRandomAd() }
                Button("로그아웃") { viewModel.logout() }
            }.padding()
            Button("이벤트 영역(광고)") { viewModel.showRandomAd() }
                .padding().background(Color.orange.opacity(0.3)).cornerRadius(10)
            VStack {
                Text("콘텐츠 \(page)")
                Button("NEXT") {
                    viewModel.navigationPath.append(PushScreen.content(page: page+1))
                }
            }
            .padding().background(Color.gray.opacity(0.1)).cornerRadius(10)
            Spacer()
        }
        .padding()
    }
} 