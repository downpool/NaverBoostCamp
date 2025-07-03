import SwiftUI
struct Menu3DetailView: View {
    @ObservedObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            HStack {
                Button("BACK") { viewModel.navigationPath.removeLast() }
                Spacer()
                Text("메뉴3 상세").font(.title2)
                Spacer()
            }.padding()
            Button("다음 단계로") {
                viewModel.navigationPath.append(PushScreen.menu3Detail2)
            }
            .padding()
        }
    }
} 