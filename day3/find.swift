import Foundation

var books: [[String]] = [
    ["Great", "true", "Novel", "3.1", "2", "197001", "198104"],
    ["Laws", "true", "Novel", "4.8", "3", "198006", "198507"],
    ["Dracula", "true", "Drama", "2.3", "6", "199105", "199605"],
    ["Mario", "true", "Drama", "3.8", "4", "200109", "201211"],
    ["House", "false", "Magazine", "4.4", "1", "198707", "202507"],
    ["Art1", "true", "Design", "4.2", "2", "198506", "199107"],
    ["Art2", "true", "Design", "3.0", "3", "199502", "200512"],
    ["Wars", "true", "Novel", "4.6", "2", "198204", "200305"],
    ["Solo", "false", "Poem", "4.9", "2", "200703", "202507"],
    ["Lost", "false", "Web", "3.2", "8", "199806", "202507"],
    ["Ocean", "true", "Magazine", "4.3", "1", "200502", "202006"]
]

func find(param0: String, param1: Int) -> String {
    var tempBooks: [[String]] = []
    
    for i in 0 ..< books.count {
        if books[i][5] <= param0 && books[i][6] >= param0 {
            tempBooks.append(books[i])
        }
    }
    
    var answerBooks: [[String]] = []
    var printAnswer: [String] = []
    
    //중요 ! 정렬에 관한 코드 !
    tempBooks = tempBooks.sorted{Double($0[3])! > Double($1[3])!}

    for book in tempBooks {
        if Int(book[4])! >= param1 {
            if book[1] == "true" {
                answerBooks.append([book[0], "*(", book[2], ") ", book[3]])
            } else {
                answerBooks.append([book[0], "(", book[2], ") ", book[3]])
            }
        }
    }
    
    if !answerBooks.isEmpty {
        for i in answerBooks {
            printAnswer.append(i.joined(separator: ""))
        }
        return printAnswer.joined(separator: ", ")
    } else {
        return "!EMPTY"
    }
}

print(find(param0: "198402", param1: 2)) // Laws*(Novel) 4.8, Wars*(Novel) 4.6
print(find(param0: "200008", param1: 6)) // Lost(Web) 3.2
print(find(param0: "199004", param1: 3)) // !EMPTY
print(find(param0: "199106", param1: 1)) 