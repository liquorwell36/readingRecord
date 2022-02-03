//
//  AddBookController.swift
//  readingRecord
//
//  Created by 坂井孝輔 on 2021/08/28.
//

import UIKit

class AddBookController: UIViewController {
    
    var currentArray: [Book] = []
    var selectedBook: Book = Book(id: 100, image: "no_image", title: "no title", author: "no author", favorite: true)
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTable.dataSource = self
        searchTable.delegate = self
        searchBar.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension AddBookController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        cell.textLabel?.text = currentArray[indexPath.row].title
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AddBookController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = currentArray[indexPath.row]
        self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "toShow", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShow" {
            let BookShow = segue.destination as! BookShowController
            BookShow.book = selectedBook 
        }
    }
}
    
// MARK: - UISearchBarDelegate
extension AddBookController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text!.isEmpty {
            currentArray = []
            return
        }
        
        guard !searchBar.text!.isEmpty else {
            currentArray = mockArray
            searchTable.reloadData()
            return
        }
        
        currentArray = mockArray.filter({ Book in
            Book.title.lowercased().contains(searchBar.text!.lowercased())
        })
        view.endEditing(true)
        searchTable.reloadData()
    }
}
