import Foundation

enum RootScreen {
    case login
    case main
}

enum MainTab: CaseIterable {
    case main, menu1, menu2, menu3
    var title: String {
        switch self {
        case .main: return "메인"
        case .menu1: return "MENU 1"
        case .menu2: return "MENU 2"
        case .menu3: return "MENU 3"
        }
    }
}

enum PushScreen: Hashable {
    case content(page: Int)
    case menu1Detail
    case menu2Detail
    case menu3Detail
    case menu3Detail2
} 