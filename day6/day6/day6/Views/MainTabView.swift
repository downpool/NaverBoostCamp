import SwiftUI

struct MainTabView: View {
    @ObservedObject var viewModel: AppViewModel
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack(spacing: 0) {
                switch viewModel.mainTab {
                case .main: MainView(viewModel: viewModel)
                case .menu1: Menu1View(viewModel: viewModel)
                case .menu2: Menu2View(viewModel: viewModel)
                case .menu3: Menu3View(viewModel: viewModel)
                }
                Divider()
                HStack {
                    ForEach(MainTab.allCases, id: \ .self) { tab in
                        Button(tab.title) { viewModel.mainTab = tab }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.mainTab == tab ? Color.blue.opacity(0.2) : .clear)
                    }
                }
            }
            .navigationDestination(for: PushScreen.self) { screen in
                switch screen {
                case .content(let page): ContentDetailView(viewModel: viewModel, page: page)
                case .menu1Detail: Menu1DetailView(viewModel: viewModel)
                case .menu2Detail: Menu2DetailView(viewModel: viewModel)
                case .menu3Detail: Menu3DetailView(viewModel: viewModel)
                case .menu3Detail2: Menu3Detail2View(viewModel: viewModel)
                }
            }
            .sheet(isPresented: $viewModel.showingAd) {
                AdModalView(viewModel: viewModel)
            }
        }
    }
} 