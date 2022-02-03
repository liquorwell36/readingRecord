//
//  ViewController.swift
//  readingRecord
//
//  Created by 坂井孝輔 on 2021/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favoriteTable: UIView!
    @IBOutlet weak var addBookTable: UIView!
    @IBOutlet weak var tabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.delegate = self
        favoriteTable.isHidden = true
        addBookTable.isHidden = false
    }
}


extension ViewController: UITabBarDelegate, UITabBarControllerDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            favoriteTable.isHidden = true
            addBookTable.isHidden = false
            print("favoriteTable.isHidden == true")
//            let favoriteController = self.tabBarController?.viewControllers?[0]
//            favoriteController?.loadView()
//            favoriteController?.viewDidLoad()
        case 2:
            favoriteTable.isHidden = false
            addBookTable.isHidden = true
            print("favoriteTable.isHidden == false")
        default:
            return
        }
    }
}

