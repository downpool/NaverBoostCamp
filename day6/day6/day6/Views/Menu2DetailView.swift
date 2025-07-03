import SwiftUI
struct Menu2DetailView: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var value = ""
    var body: some View {
        VStack {
            HStack {
                Button("BACK") { viewModel.navigationPath.removeLast() }
                Spacer()
                Text("숫자 입력").font(.title2)
                Spacer()
            }.padding()
            TextField("숫자 입력", text: $value)
                .keyboardType(.numberPad)
                .padding()
            Button("SAVE") {
//                viewModel.navigationPath.removeAll()
                viewModel.mainTab = .main
            }
            .padding()
        }
    }
} 
