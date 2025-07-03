import Foundation

// 방법 1: if-else문 사용
func funcLadder_Plus(_ num: Int) -> Int {
    var now: Int = num
    if now == 4 {
        now += 10
    } else if now == 8 {
        now += 22
    } else if now == 21 {
        now += 21
    } else if now == 28 {
        now += 48
    } else if now == 50 {
        now += 17
    } else if now == 71 {
        now += 21
    } else if now == 80 {
        now += 19
    } else {
        return now
    }
    return now
}

// 방법 2: 배열 사용
func funcLadder_Array(_ num: Int) -> Int {
    let from: [Int] = [4, 8, 21, 28, 50, 71, 80]
    let to: [Int] = [14, 30, 42, 76, 67, 92, 99]

    if let add = from.firstIndex(of: num) {
        return to[add]
    } else {
        return num
    }
}

// 방법 1: if-else문 사용
// func funcSnake_Minus(_ num: Int) -> Int {

// }

// // 방법 2: 배열 사용
// func funcSnake_Array(_ num: Int) -> Int {

// }

print(funcLadder_Array(4))
print(funcLadder_Plus(4))
print(funcLadder_Array(10))
print(funcLadder_Plus(10))