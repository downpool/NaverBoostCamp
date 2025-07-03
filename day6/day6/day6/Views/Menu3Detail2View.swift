import SwiftUI
struct Menu3Detail2View: View {
    @ObservedObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            HStack {
                Button("BACK") { viewModel.navigationPath.removeLast() }
                Spacer()
                Text("ON/OFF 선택").font(.title2)
                Spacer()
            }.padding()
            HStack {
                Button("ON") { viewModel.navigationPath.removeLast() }
                Button("OFF") { viewModel.navigationPath.removeLast() }
            }
            .padding()
        }
    }
} 