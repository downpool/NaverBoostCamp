## 좌우명: 아무리 어려워도 결국에는 오늘 안에 풀린다.

### 나의 접근법 및 해결 과정

1. 일단 다이어그램의 상태값들을 나열하였다.
2. 그후 딕셔너리를 이용해야 한다는것을 알게 되었다.
3. let States: \[String:\[String:String]]의 구조로, \[from:\[by:to] 구조로 만들었다.
### 새롭게 배운 문법

### 배열 관련 문법

```swift
func matches(_ input: String, _ pattern: String) -> Bool {
	if pattern == "1xx", input.hasPrefix("1") { return true }
	if pattern == "3xx", input.hasPrefix("3") { return true }
	if pattern == "4xx-6xx" {
		if let first = input.first, "456".contains(first) { return true }
	}
	return input == pattern
}
```


### 나만의 체크포인트

1. 일반적인 상태 전환 다이어그램 구성에 대해 이해할 수 있다.
2. 일반적인 상태 전환 다이어그램 구성에 대해 구현할 수 있다.
3. 비교문 대신 데이터 구조로 변환 하여 이용할 수 있다.
4. 상태 관리를 구현할 수 있다.
5. 필요에 맞게 데이터 구조를 변형해서 사용할 수 있다.
6. 문제의 조건에 맞게 코드를 작성할 수 있다.
