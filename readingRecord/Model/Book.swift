//
//  Book.swift
//  readingRecord
//
//  Created by 坂井孝輔 on 2021/08/28.
//

import Foundation
import RealmSwift

class Book: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var image: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var favorite: Bool = true
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func favoriteFilter(array: [Book]) -> [Book] {
        array.filter { (book) -> Bool in
            book.favorite == true
        }
    }
    
    convenience init(id: Int, image: String, title: String, author: String, favorite: Bool) {
        self.init()
        self.id = id
        self.image = image
        self.title = title
        self.author = author
        self.favorite = favorite
    }
}

var mockArray: [Book] = [
    Book(id: 0, image: "no_image", title: "Book1", author: "Author1", favorite: true),
    Book(id: 1, image: "no_image", title: "Book2", author: "Author2", favorite: false),
    Book(id: 2, image: "no_image", title: "Book3", author: "Author3", favorite: false),
    Book(id: 3, image: "no_image", title: "Book4", author: "Author4", favorite: false),
    Book(id: 4, image: "no_image", title: "Book5", author: "Author5", favorite: false),
    Book(id: 5, image: "no_image", title: "Book6", author: "Author6", favorite: false),
    Book(id: 6, image: "no_image", title: "Book7", author: "Author7", favorite: false),
    Book(id: 7, image: "no_image", title: "Book8", author: "Author8", favorite: false),
    Book(id: 8, image: "no_image", title: "Book9", author: "Author9", favorite: false),
    Book(id: 9, image: "no_image", title: "Book10", author: "Author10", favorite: false),
    Book(id: 10, image: "no_image", title: "Windows 10", author: "Bill", favorite: false),
    Book(id: 11, image: "no_image", title: "Windows 11", author: "Bill", favorite: false),
    Book(id: 12, image: "no_image", title: "Windows 12", author: "Bill", favorite: false),
    Book(id: 13, image: "no_image", title: "Windows 13", author: "Bill", favorite: false),
    Book(id: 14, image: "no_image", title: "Windows 14", author: "Bill", favorite: false),
    Book(id: 15, image: "no_image", title: "Windows 15", author: "Bill", favorite: false),
    Book(id: 16, image: "no_image", title: "Windows 16", author: "Bill", favorite: false),
]

