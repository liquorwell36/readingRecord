//
//  BookShowController.swift
//  readingRecord
//
//  Created by 坂井孝輔 on 2021/08/28.
//

import UIKit

class BookShowController: UIViewController {

    var book: Book = Book(id: 100, image: "no image", title: "no title", author: "no author", favorite: false)
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookImage.image = UIImage(named: "no_image")
        bookTitle.text = book.title
        author.text = book.author
        
        if book.favorite == true {
            favoriteButton.setTitle("お気に入り解除", for: .normal)
        } else {
            favoriteButton.setTitle("お気に入り追加", for: .normal)
        }
    }
    

    @IBAction func addFavorite(_ sender: UIButton) {
        BookManager().changeFavorite(book)
        if book.favorite == true {
            print(book.favorite)
            favoriteButton.setTitle("お気に入り解除", for: .normal)
        } else {
            print(book.favorite)
            favoriteButton.setTitle("お気に入り追加", for: .normal)
        }
    }
}
