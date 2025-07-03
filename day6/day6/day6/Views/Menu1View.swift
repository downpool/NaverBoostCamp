import SwiftUI

struct Menu1View: View {
    @ObservedObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            Text("MENU 1").font(.title)
            Button("상세로") {
                viewModel.navigationPath.append(PushScreen.menu1Detail)
            }
            Spacer()
        }
    }
} 