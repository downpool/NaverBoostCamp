import SwiftUI
struct Menu3View: View {
    @ObservedObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            Text("MENU 3").font(.title)
            Button("상세로") {
                viewModel.navigationPath.append(PushScreen.menu3Detail)
            }
            Spacer()
        }
    }
} 