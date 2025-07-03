## 좌우명: 아무리 어려워도 결국에는 오늘 안에 풀린다.

### 나의 접근법 및 해결 과정

1. 코드 제출 양식을 보고, 프로그래밍 요구 사항에 디렉토리 깊이는 10단계 이하로, 입력값 파일명은 100개 이하로 제작하였다 // 이 부분은 코드 입력 조건에 포함 되어있어 코드에 굳이 수정을 안하였다.
2. 일단 원본 파일명을 \~~.\~~로 맞추고, \_v~는 제거하여 키값으로 넣기로 결정하였다.(regex사용)
3. 딕셔너리를 사용하기로 했고, "/"를 사용하여 split을 하고 guard let tempIdx = temp.last else { continue } 으로 마지막 값을 가져왔다.
4. 그 뒤 \_v2이런 값을 지우기 위해 정규 표현식을 사용하였다.
5. 그리고 나서 ansMap에 정제된 값이 존재하면 += 1, 없으면 0부터 += 1이 되도록 하였다.
6. 위 순회가 끝나면 출력 전에 key, value를 순회하여 value가 1이면 nil을 넣어 제거하였고, 0인 경우는 없으니 생략하였다.

### 새롭게 배운 문법

### regex!!!

```swift
func regexs(_ filename: String) -> String {
	guard let regex = try? NSRegularExpression(pattern: "_v\\d+") else {
		return filename
	}
	
	let range = NSRange(filename.startIndex..<filename.endIndex, in: filename)
	let modified = regex.stringByReplacingMatches(in: filename, options: [], range: range, withTemplate: "")
	return modified
}
```


### 나만의 체크포인트

1. 기존에 만든 해시맵을 기억하며 자료구조를 필요에 따라 선택, 사용할 수 있다.
2. 정규표현식에 대해 이해 할 수 있다.
3. 필요에 맞게 정규표현식을 제작, 사용할 수 있다.
4. 문제의 조건에 맞게 코드를 작성할 수 있다.
