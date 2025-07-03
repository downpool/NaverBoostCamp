import SwiftUI
struct Menu2View: View {
    @ObservedObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            Text("MENU 2").font(.title)
            Button("상세로") {
                viewModel.navigationPath.append(PushScreen.menu2Detail)
            }
            Spacer()
        }
    }
} 