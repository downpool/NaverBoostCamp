import Foundation
import Combine

class HistoryStore: ObservableObject {
    @Published var histories: [ScreenHistory] = []
    var userId: String { "user1" } // 실제 앱에서는 로그인 정보에서 가져옴

    func log(screen: ScreenName, action: ScreenAction, target: ScreenName? = nil, extra: String? = nil) {
        let record = ScreenHistory(
            id: UUID(),
            userId: userId,
            screen: screen,
            action: action,
            timestamp: Date(),
            targetScreen: target,
            extra: extra
        )
        histories.append(record)
    }
} 