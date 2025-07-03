import SwiftUI

struct AdModalView: View {
    @ObservedObject var viewModel: AppViewModel
    var body: some View {
        VStack {
            Text("광고 \(viewModel.adType)").font(.largeTitle)
            Button("CLOSE") { viewModel.showingAd = false }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.3))
    }
} 