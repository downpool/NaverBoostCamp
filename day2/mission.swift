import Foundation

var one: [Int] = [10]
var two: [Int] = [30]
var three: [Int] = [50]
var four: [Int] = [80]
var penalty: [Int] = [0, 0, 0]

func compare(_ user1Card: Int, _ user2Card: Int, _ user3Card: Int) {
    let cards = [(user1Card, 0), (user2Card, 1), (user3Card, 2)]  // (카드값, 참가자 인덱스)
    let sortedCards = cards.sorted { $0 < $1 }  // 작은 카드부터 처리
    
    for (card, playerIdx) in sortedCards {
        // nil 처리 => ??
        let lastArrayValues = [one.last ?? -1, two.last ?? -1, three.last ?? -1, four.last ?? -1]
        
        var minDiff = Int.max
        var selectedIdx = -1
        var selectedLastValue = -1
        
        for (i, last) in lastArrayValues.enumerated() {
            if last == -1 { continue }
            let diff = abs(last - card)
            
            if diff < minDiff {
                minDiff = diff
                selectedIdx = i
                selectedLastValue = last
            } else if diff == minDiff {
                if last > selectedLastValue {
                    selectedIdx = i
                    selectedLastValue = last
                }
            }
        }
        
        if selectedIdx == -1 {
            continue  // 모든 배열 비었으면 아무것도 못함
        }
        
        let selectedLast = lastArrayValues[selectedIdx]
        
        if card < selectedLast {
            // 배열에 추가
            switch selectedIdx {
            case 0: one.append(card)
            case 1: two.append(card)
            case 2: three.append(card)
            case 3: four.append(card)
            default: break
            }
        } else {
            // 배열 비우고 벌점
            let penaltyCount: Int
            switch selectedIdx {
            case 0:
                penaltyCount = one.count
                one = []
            case 1:
                penaltyCount = two.count
                two = []
            case 2:
                penaltyCount = three.count
                three = []
            case 3:
                penaltyCount = four.count
                four = []
            default:
                penaltyCount = 0
            }
            penalty[playerIdx] += penaltyCount
        }
    }
}

func play() {
    while true {
        print("카드 3장을 입력하세요. (예: [10,20,30])")
        guard let line = readLine() else { break }
        
        let trimmed = line.trimmingCharacters(in: CharacterSet(charactersIn: "[]"))
        let ABCInput = trimmed.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        print(ABCInput)
        if ABCInput.count % 3 != 0 {
            penalty = [0, 0, 0]
            print("3의 배수 아님")
            break
        }
        
        compare(ABCInput[0], ABCInput[1], ABCInput[2])

        if one.isEmpty && two.isEmpty && three.isEmpty && four.isEmpty {
            print("배열 빔")
            break
        }
        let result: [String: Int] = ["A":penalty[0], "B":penalty[1], "C":penalty[2]]
        print(result)
    }
}

play()
