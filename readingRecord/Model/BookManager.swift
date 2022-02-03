//
//  BookManager.swift
//  readingRecord
//
//  Created by 坂井孝輔 on 2021/09/16.
//

import Foundation
import RealmSwift

class BookManager {
    let realm = try! Realm()
    
    func displayBooks(_ books: [Book]) -> [Book] {
        let books = realm.objects(Book.self)
        return Array(books)
    }
    
    func favoriteBooks() -> [Book] {
        let favorites = realm.objects(Book.self).filter("favorite = true")
        return Array(favorites)
    }
    
    func isFavoritedBook(_ book: Book) -> Bool {
        let favorites = realm.objects(Book.self).filter("favorite = true")
        return favorites.contains(book)
    }
    
    func changeFavorite(_ book: Book) {
        try! realm.write({
            if realm.objects(Book.self).filter("id = \(book.id)").isEmpty {
                print("Realmにデータがないので、これから作成します。")
                realm.add(book)
                book.favorite = true
            } else {
                if book.favorite == false {
                    print("\(book)は既に存在しています。favoriteをtrueに変更しました。")
                    book.favorite = true
                    mockArray[book.id].favorite = true
                } else {
                    print("\(book)は既に存在しています。favoriteをfalseに変更しました。")
                    book.favorite = false
                    mockArray[book.id].favorite = false
                }
            }
        })
    }
}
