import Foundation

enum ScreenName: String, Codable {
    case login, main, content, menu1, menu2, menu3
    case menu1Detail, menu2Detail, menu3Detail, menu3Detail2
    case adModal
}

enum ScreenAction: String, Codable {
    case view        // 화면 진입
    case push        // 푸시(스택 쌓기)
    case pop         // 스택에서 제거
    case transition  // 전환(메뉴/메인)
    case modal       // 모달(광고)
    case scroll      // 스크롤
    case input       // 입력
    case save        // 저장
    case select      // ON/OFF 등 선택
}

struct ScreenHistory: Identifiable, Codable {
    let id: UUID
    let userId: String
    let screen: ScreenName
    let action: ScreenAction
    let timestamp: Date
    let targetScreen: ScreenName?   // 전환/푸시/팝의 목적지
    let extra: String?              // 광고 종류, 입력값, 스크롤 횟수 등
} 