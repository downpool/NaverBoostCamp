//
//  ContentView.swift
//  day6
//
//  Created by donghyeon choi on 6/30/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = AppViewModel()
    var body: some View {
        switch viewModel.rootScreen {
        case .login:
            LoginView(viewModel: viewModel)
        case .main:
            MainTabView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView()
}

//struct Menu1DetailView: View {
//    @ObservedObject var viewModel: AppViewModel
//    @State private var hScroll = 0
//    @State private var vScroll = 0
//    var body: some View {
//        VStack {
//            HStack {
//                Button("BACK") { viewModel.navigationPath.removeLast() }
//                Spacer()
//                Text("상하좌우 스크롤").font(.title2)
//                Spacer()
//            }.padding()
//            HStack {
//                Text("가로: \(hScroll)")
//                Text("세로: \(vScroll)")
//            }
//            ScrollView([.horizontal, .vertical]) {
//                LazyVStack {
//                    ForEach(1...5, id: \.self) { row in
//                        HStack {
//                            ForEach(1...8, id: \.self) { col in
//                                Rectangle().frame(width: 60, height: 60)
//                                    .onAppear { hScroll += 1 }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

