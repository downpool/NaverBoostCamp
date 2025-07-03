import SwiftUI

struct ContentDetailView: View {
    @ObservedObject var viewModel: AppViewModel
    let page: Int
    var body: some View {
        VStack {
            HStack {
                Button("BACK") { viewModel.navigationPath.removeLast() }
                Spacer()
                Text("콘텐츠 \(page)").font(.title2)
                Spacer()
            }.padding()
            ScrollView {
                ForEach(1...10, id: \.self) { i in
                    Text("페이지 \(i)").padding().background(Color.gray.opacity(0.1)).cornerRadius(8)
                }
            }
            Button("NEXT") {
                viewModel.navigationPath.append(PushScreen.content(page: page+1))
            }
            .padding()
        }
    }
} 