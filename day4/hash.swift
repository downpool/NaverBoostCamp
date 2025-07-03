import Foundation

let bucketSize = 16
var buckets: [[(String, String)]] = Array(repeating: [], count: bucketSize)

func hash(_ key: String) -> Int {
    // String이면
    var hashValue = 0
    for char in key {
        hashValue = (hashValue * 31 + Int(char.asciiValue ?? 0)) % bucketSize
    }
    // Int면
    // return key % bucketSize
    return hashValue
}

func clear() -> Void {
    buckets = Array(repeating: [], count: bucketSize)
}

func containsKey(_ key: String) -> Bool {
    let index = hash(key)
    for (k, _) in buckets[index] {
        if k == key {
            return true
        }
    }
    return false
} 

func get(_ key: String) -> String {
    let index = hash(key)
    for (k, v) in buckets[index] {
        if k == key {
            return v
        }
    }
    return ""
}

func isEmpty() -> Bool {
    for b in buckets {
        if !b.isEmpty {
            return false
        }
    }
    return true
}

func keys() -> [String] {
    var keys: [String]
    for b in buckets {
        for (k, _) in b {
            keys.append(k)
        }
    }
    return keys
}

func put(_ key: String, _ value: String) -> Void {
    let index = hash(key)
    for idx in 0 ..< buckets[index].count {
        // 찾으면 수정
        if buckets[index][idx].0 == key {
            buckets[index][idx].1 = value
            return
        }
    }
    // 없으면 추가
    buckets[index].append((key, value))
} 

func remove(_ key: String) -> Void {
    let index = hash(key)
    buckets[index].removeAll{ $0.0 == key }
}

func size() -> Int {
    var count = 0
    for bucket in buckets {
        count += bucket.count
    }
    return count
}