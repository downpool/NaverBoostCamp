import Foundation

struct Book {
    let name: String
    let OutOfPrint: Bool
    let category: String
    let rating: Double
    let stock: Int
    let start: Int  // YYYYMM
    let end: Int    // YYYYMM
}

let books: [Book] = [
    Book(name: "Great", OutOfPrint: true, category: "Novel", rating: 3.1, stock: 2, start: 197001, end: 198104),
    Book(name: "Laws", OutOfPrint: true, category: "Novel", rating: 4.8, stock: 3, start: 198006, end: 198507),
    Book(name: "Dracula", OutOfPrint: true, category: "Drama", rating: 2.3, stock: 6, start: 199105, end: 199605),
    Book(name: "Mario", OutOfPrint: true, category: "Drama", rating: 3.8, stock: 4, start: 200109, end: 201211),
    Book(name: "House", OutOfPrint: false, category: "Magazine", rating: 4.4, stock: 1, start: 198707, end: 202506),
    Book(name: "Art1", OutOfPrint: true, category: "Design", rating: 4.2, stock: 2, start: 198506, end: 199107),
    Book(name: "Art2", OutOfPrint: true, category: "Design", rating: 3.0, stock: 3, start: 199502, end: 200512),
    Book(name: "Wars", OutOfPrint: true, category: "Novel", rating: 4.6, stock: 2, start: 198204, end: 200305),
    Book(name: "Solo", OutOfPrint: false, category: "Poem", rating: 4.9, stock: 2, start: 200703, end: 202506),
    Book(name: "Lost", OutOfPrint: false, category: "Web", rating: 3.2, stock: 8, start: 199806, end: 202506),
    Book(name: "Ocean", OutOfPrint: true, category: "Magazine", rating: 4.3, stock: 1, start: 200502, end: 202006)
]

func find(param0: String, param1: Int) -> String {
    let time = Int(param0)!
    var AvailableBooks: [Book] = []

    //절편 상관없이 조건에 해당하면
    for i in 0..<books.count {
        if time > books[i].start && time < books[i].end && books[i].stock >= param1 {
            AvailableBooks.append(books[i])
        }
    }

    // 별점 기준 내림차순 정렬
    AvailableBooks.sort { $0.rating > $1.rating }

    var results: [String] = []
    for book in AvailableBooks {
        if book.OutOfPrint { //절편 True
            results.append(book.name + "*(" + book.category + ") " + String(book.rating))
        } else { //절편 False
            results.append(book.name + "(" + book.category + ") " + String(book.rating))
        }
    }
    if results.isEmpty {
        return "!EMPTY"
    } else {
        return results.joined(separator: ", ")
    }
}



print(find(param0: "199106", param1: 1))