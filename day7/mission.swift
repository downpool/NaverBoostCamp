import Foundation

func match(_ param0: [String]) -> [String:Int] {
    var ansMap: [String: Int] = [:]
    
    for i in param0 {
        let temp = i.split(separator: "/")
        guard let tempIdx = temp.last else { continue }
        let modified = regexs(String(tempIdx))
        ansMap[modified, default: 0] += 1
    }
    for (key, value) in ansMap {
        if value == 1 {
            ansMap[key] = nil
        }
    }
    return ansMap
}

func regexs(_ filename: String) -> String {
    guard let regex = try? NSRegularExpression(pattern: "_v\\d+") else {
        return filename
    }
    
    let range = NSRange(filename.startIndex..<filename.endIndex, in: filename)
    let modified = regex.stringByReplacingMatches(in: filename, options: [], range: range, withTemplate: "")
    
    return modified
}

// 데이터 입력/출력 부분
if let input = readLine() {
	let arr = input.split(separator: ",").map{ String($0)}
	let answer = match(arr)
        if answer.isEmpty { 
            print("!EMPTY")
        }
	for entry in answer {
		print("\(entry.key)=\(entry.value)")
	}
}