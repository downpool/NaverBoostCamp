## 좌우명: 아무리 어려워도 결국에는 오늘 안에 풀린다.

## 문제 : 
	var a = new A.init();
이 코드를 AST 데이터 구조로 변환해서 처리하는 프로그램(코드) 작성.
### 나의 접근법 및 해결 과정

1. 나는 보자마자 바로 학교에서 배웠던 "프로그래밍 언어 개론"수업이 떠올랐고, 이론자료를 바로 들어갔다. (동시에 알고 있던 내용이 나와, 환호성 나온건 덤..ㅎㅎ)![[스크린샷 2025-06-27 12.37.58.png]]
2. AST의 정의는 "프로그램의 추상 구조를 나타내는 트리형태의 자료구조"라고 한다. 관련된 키워드에는 Parse Tree, Parser등이 있다.
3. Parse tree는 문법으로 부터의 유도과정을 전부 포함하는 반면, AST는 실행 또는 컴파일에 필요한 프로그램의 구조 만을 포함
4. Parser는 소스코드를 입력으로 받아 AST를 생성함.

5. 위 도표를 보면 프로그램이 /어휘 분석을 하고/ 토큰화 과정을 거친 뒤/ 문법 분석을 하고/ 나서 추상 구문 트리로 변환해서 컴파일러, 인터프리터에 전달 하고, 컴파일러에 전달하면 바이너리 프로그램이 되고, 인터프리터에 전달하면 실행 결과가 나오는 과정으로 볼수 있다.
6. 요약하면 컴파일러는 소스코드를 AST로 변환 후 다양한 분석 및 최적화를 수행하고(중간 언어로 변환하기도 함), 
7. 인터프리터는 소스코드를 AST로 변환후 바로 실행한다.(물론 요것도 중간언어 변환 가능함.)


8. 문제를 다시 보니 코드->중간 과정->AST->컴파일->프로그램 과정에서 "중간 과정" 에 해당하는 코드를 작성해야 하는것으로 보인다.
9. 쨋든 일단 내가 마지막으로 썻던 AST OCaml파일을 가져와 봤다.

```Ocaml
module F = Format

type expr = Num of int
| Name of string
| Ref of string
| Bool of bool
| Add of expr * expr
| Sub of expr * expr
| Lt of expr * expr
| Gt of expr * expr
| Eq of expr * expr
| And of expr * expr
| Or of expr * expr

type stmt = VarDeclStmt of string
| StoreStmt of expr * expr
| LoadStmt of string * expr
| IfStmt of expr * stmt list * stmt list
| WhileStmt of expr * stmt list

type prog = Program of stmt list

let rec pp_expr fmt e =
match e with
| Num n -> F.fprintf fmt "%d" n
| Name x -> F.fprintf fmt "%s" x
| Ref x -> F.fprintf fmt "&%s" x
| Bool b -> F.fprintf fmt "%b" b
| Add (e1, e2) -> F.fprintf fmt "%a + %a" pp_expr e1 pp_expr e2
| Sub (e1, e2) -> F.fprintf fmt "%a - %a" pp_expr e1 pp_expr e2
| Lt (e1, e2) -> F.fprintf fmt "%a < %a" pp_expr e1 pp_expr e2
| Gt (e1, e2) -> F.fprintf fmt "%a > %a" pp_expr e1 pp_expr e2
| Eq (e1, e2) -> F.fprintf fmt "%a == %a" pp_expr e1 pp_expr e2
| And (e1, e2) -> F.fprintf fmt "%a && %a" pp_expr e1 pp_expr e2
| Or (e1, e2) -> F.fprintf fmt "%a || %a" pp_expr e1 pp_expr e2

let rec pp_stmt fmt s =

match s with
| VarDeclStmt x -> F.fprintf fmt "def %s;" x
| StoreStmt (e1, e2) -> F.fprintf fmt "*%a = %a;" pp_expr e1 pp_expr e2
| LoadStmt (x, e) -> F.fprintf fmt "%s = *%a;" x pp_expr e
| IfStmt (e, s1, s2) -> F.fprintf fmt "if %a { %a } else { %a }" pp_expr e
(F.pp_print_list (fun fmt s -> F.fprintf fmt "%a" pp_stmt s)) s1
(F.pp_print_list (fun fmt s -> F.fprintf fmt "%a" pp_stmt s)) s2
| WhileStmt (e, sl) -> F.fprintf fmt "while %a { %a }" pp_expr e
(F.pp_print_list (fun fmt s -> F.fprintf fmt "%a" pp_stmt s)) sl
  
let pp fmt (Program sl) =
F.fprintf fmt "%a" (F.pp_print_list
~pp_sep:(fun fmt () -> F.fprintf fmt "\n")
(fun fmt s -> F.fprintf fmt "%a" pp_stmt s)) sl

let rec pp_expr_ast fmt e =
match e with
| Num n -> F.fprintf fmt "(Num %d)" n
| Name x -> F.fprintf fmt "(Name %s)" x
| Ref x -> F.fprintf fmt "(Ref %s)" x
| Bool b -> F.fprintf fmt "(Bool %b)" b
| Add (e1, e2) -> F.fprintf fmt "(Add %a, %a)" pp_expr_ast e1 pp_expr_ast e2
| Sub (e1, e2) -> F.fprintf fmt "(Sub %a, %a)" pp_expr_ast e1 pp_expr_ast e2
| Lt (e1, e2) -> F.fprintf fmt "(Lt %a, %a)" pp_expr_ast e1 pp_expr_ast e2
| Gt (e1, e2) -> F.fprintf fmt "(Gt %a, %a)" pp_expr_ast e1 pp_expr_ast e2
| Eq (e1, e2) -> F.fprintf fmt "(Eq %a, %a)" pp_expr_ast e1 pp_expr_ast e2
| And (e1, e2) -> F.fprintf fmt "(And %a, %a)" pp_expr_ast e1 pp_expr_ast e2
| Or (e1, e2) -> F.fprintf fmt "(Or %a, %a)" pp_expr_ast e1 pp_expr_ast e2
  
let rec pp_stmt_ast fmt s =
match s with
| VarDeclStmt x -> F.fprintf fmt "(VarDeclStmt %s)" x
| StoreStmt (e1, e2) -> F.fprintf fmt "(StoreStmt %a, %a)" pp_expr_ast e1 pp_expr_ast e2
| LoadStmt (x, e) -> F.fprintf fmt "(LoadStmt %s, %a)" x pp_expr_ast e
| WhileStmt (e, sl) -> F.fprintf fmt "(WhileStmt %a, %a)" pp_expr e
(F.pp_print_list ~pp_sep:(fun fmt () -> F.fprintf fmt "; ") (fun fmt s ->
F.fprintf fmt "%a" pp_stmt_ast s)) sl
| IfStmt (e, s1, s2) -> F.fprintf fmt "(IfStmt %a, [%a], [%a])" pp_expr_ast e
(F.pp_print_list ~pp_sep:(fun fmt () -> F.fprintf fmt "; ") (fun fmt s ->
F.fprintf fmt "%a" pp_stmt_ast s)) s1
(F.pp_print_list ~pp_sep:(fun fmt () -> F.fprintf fmt "; ") (fun fmt s ->
F.fprintf fmt "%a" pp_stmt_ast s)) s2

let pp_ast fmt (Program sl) =
F.fprintf fmt "(Program [%a])" (F.pp_print_list
~pp_sep:(fun fmt () -> F.fprintf fmt "; ")
(fun fmt s -> F.fprintf fmt "%a" pp_stmt_ast s)) sl

```
1. (길다...) 코드를 짧게 요약을 하면, program -> statment -> expression 단계로 나누어서 최종 실행을 하면 AST로 출력되는 코드이다.
2. 이제 이것을 swift형식으로 바꾸어 보았다. AST.swift <참고>


3. 이렇게 써보니 Swift에서 어떤 방식으로 작동하는지 좀 짐작이 간다.
4. 설명이 더 필요하시면 커맨트 달아주세요!!ㅠㅠ

### 새롭게 배운 문법

indirect: - Swift의 열거형(enum)에서 재귀적인 데이터 구조를 표현할 수 있도록 해주는 문법
		열거형의 케이스가 자기 자신을 포함할 수 있게 만들어서  
	    재귀적으로 중첩된 데이터 구조를 명확하고 간결하게 정의


### 어제 배운것을 적용한 부분.

교수님... 감사합니다....
덕분에 쉽게 해결할 수 있었습니다...

## 오늘 배운점.

학교에서 배우는것들은 실무에 도움이 그닥 되지 않는다 라고 생각했는데 오산이었다..
Swift에서는 코드가 어떤 식으로 작동하는지, 어떻게 처리가 되고 어떤 식으로 컴파일 전 전처리를 하는지 알게 되었다.
