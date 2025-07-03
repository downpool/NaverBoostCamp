import Foundation

func nextPosition(current: Int, _ dice: Int) -> Int {
    if (ladder(current: current, dice) != dice) {
        return ladder(current: current, dice)
    }
    else if (snake(current: current, dice) != dice){
        return snake(current: current, dice)
    }
    else {
        return dice
    }
}

func ladder(current: Int, _ dice: Int) -> Int {
    let next = current + dice
    if (next == 4) {
        return dice + 10
    }
    else if (next == 8) {
        return dice + 22
    }
    else if (next == 28) {
        return dice + 48
    }
    else if (next == 21) {
        // 기존 코드
        // return dice + 42

        // 수정 코드
        return dice + 21
    }
    else if (next == 50) {
        return dice + 17
    }
    else if (next == 71) {
        // 기존 코드
        // return dice + 92

        // 수정 코드
        return dice + 21
    }
    else if (next == 80) {
        return dice + 19
    }
    
    return dice
}

func snake(current: Int, _ dice: Int) -> Int {
    let next = current + dice
    if (next == 32) {
        return dice - 22
    } 
    else if (next == 36) {
        return dice - 30
    } 
    else if (next == 48) {
        return dice - 42
    } 
    else if (next == 62) {
        return dice - 44
    } 
    else if (next == 88) {
        return dice - 64 
    } 
    else if (next == 95) {
        return dice - 39 
    } 
    else if (next == 97) {
        return dice - 19
    }

    return dice
}

var start = 1
var next = 1
var dice = 3
// nextPosition은 "이동할 거리" == ("주사위 값" + "사다리 값").
// start는 현재 위치
// dice는 움직일 위치(+ 예상 위치)
// next는 다음 위치.
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")


start = next
dice = 4
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")

start = next
dice = 3
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")

start = next
dice = 5
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")

start = next
dice = 1
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")

// testcodes
start = next
dice = 3
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")

start = next
dice = 4
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")

start = next
dice = 5
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")

start = next
dice = 2
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")

start = next
dice = 0
next = start + nextPosition(current: start, dice)
print("from= \(start), dice=\(dice), next=\(next)")
