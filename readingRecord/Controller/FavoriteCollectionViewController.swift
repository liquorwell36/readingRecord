//
//  FavoriteCollectionViewController.swift
//  readingRecord
//
//  Created by 坂井孝輔 on 2021/08/29.
//

import UIKit

class FavoriteCollectionViewController: UIViewController {

    var favoriteArray: [Book] = []
    var selectedBook: Book = Book(id: 100, image: "no_image", title: "no title", author: "no author", favorite: false)
    var selectedTitle: String = ""

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        favoriteArray = mockArray.filter { (book) in
//            return book.favorite == true
//        }
        favoriteArray = BookManager().favoriteBooks()
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CustomViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("FavoCollectionのviewWillAppearが呼ばれたぜ!!")
        self.collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension FavoriteCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count: \(favoriteArray.count)")
        return favoriteArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomViewCell
        selectedTitle = favoriteArray[indexPath.row].title
        cell.setTitle(selectedTitle)
        //cell.setImage("no_image")
        return cell
    }
}

extension FavoriteCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        selectedBook = favoriteArray[indexPath.row]
        performSegue(withIdentifier: "fromFavoriteToShow", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromFavoriteToShow" {
            let BookShow = segue.destination as! BookShowController
            BookShow.book = selectedBook
        }
    }
}
