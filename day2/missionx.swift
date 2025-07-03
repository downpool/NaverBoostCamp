import Foundation

var one: [Int] = [10]
var two: [Int] = [30]
var three: [Int] = [50]
var four: [Int] = [80]
var numbers: [Int]

var penalty: [Int] = [0, 0, 0]

func compare (_ user1Card: Int, _ user2Card: Int, _ user3Card: Int) -> Bool {
    if user1Card < user2Card {
        if user1Card < user3Card && user3Card < user2Card {
            //1-3-2
            let arr = conditionCheck(user1Card, user3Card, user2Card)
            penalty = [arr[0], arr[2], arr[1]]
        } else if user2Card < user3Card {
            //1-2-3
            let arr = conditionCheck(user1Card, user2Card, user3Card)
            penalty = [arr[0], arr[1], arr[2]]
        } else {
            //3-1-2
            let arr = conditionCheck(user3Card, user1Card, user2Card)
            penalty = [arr[2], arr[0], arr[1]]
        }
    } else {
        if user2Card < user3Card && user3Card < user1Card {
            //2-3-1
            let arr = conditionCheck(user2Card, user3Card, user1Card)
            penalty = [arr[1], arr[2], arr[0]]
        } else if user1Card < user3Card {
            //2-1-3
            let arr = conditionCheck(user2Card, user1Card, user3Card)
            penalty = [arr[1], arr[0], arr[2]]
        } else {
            //3-2-1
            let arr = conditionCheck(user3Card, user2Card, user1Card)
            penalty = [arr[2], arr[1], arr[0]]
        }
    }
}

func conditionCheck(_ A: Int, _ B: Int, _ C: Int) -> [Int] {
    let lastOne = one.last ?? 0
    let lastTwo = two.last ?? 0
    let lastThree = three.last ?? 0
    let lastFour = four.last ?? 0

    var choice = [0, 0, 0]
    for i in [A, B, C] {
        var abc = 0
        var similar = 101
        var count = 1
        for j in [lastOne, lastTwo, lastThree, lastFour] {
            // 빈 배열이면
            if j == 0 {
                // 인덱스 처리 꼭!
                count += 1
                continue
            }
            // 비어있지 않고, 가장 가까운 값을 찾음
            if (j - i) < similar && (j - i) > 0 {
                // choiced = count
                similar = j - i
            }
            // 페널티 처리
            else if (j - i) < similar && (j - i) < 0 {
                if count == 0 {
                    choice[abc] += one.count
                    one = []
                } else if count == 1 {
                    choice[abc] += two.count
                    two = []
                } else if count == 2 {
                    choice[abc] += three.count
                    three = []
                } else if count == 3 {
                    choice[abc] += four.count
                    four = []
                } 

            }
            // 인덱스 처리 꼭!
            count += 1
        }
        abc += 1
    }
    return choice
}

func play() {
    do {
        var ABCInput = readLine()!.trimmingCharacters(in: CharacterSet(charactersIn: "[]")).split(separator: ",").map{Int($0)!}
        if ABCInput.count % 3 != 0 {
            penalty = [0, 0, 0]
            break
        } else {
            compare(ABCInput[0], ABCInput[1], ABCInput[2])
        } 
    } while (ABCInput != [] || (one.count == 0 || two.count == 0 || three.count == 0 || four.count == 0))
    var array: [(String, Int)] = [("A", penalty[0]), ("B", penalty[1]), ("C", penalty[2])]
    print(array)
}