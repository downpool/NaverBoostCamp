import Foundation
import SwiftUI

class AppViewModel: ObservableObject {
    @Published var rootScreen: RootScreen = .login
    @Published var mainTab: MainTab = .main
    @Published var navigationPath = NavigationPath()
    @Published var showingAd = false
    @Published var adType: Int = 0
    @Published var isLoggedIn: Bool = false

    func login() {
        isLoggedIn = true
        rootScreen = .main
    }
    func logout() {
        isLoggedIn = false
        rootScreen = .login
        mainTab = .main
//        navigationPath.removeAll()
    }
    func showRandomAd() {
        adType = Int.random(in: 1...5)
        showingAd = true
    }
} 
