//
//  CustomViewCell.swift
//  readingRecord
//
//  Created by 坂井孝輔 on 2021/09/12.
//

import UIKit

class CustomViewCell: UICollectionViewCell {

    
    @IBOutlet weak var BookImage: UIImageView!
    @IBOutlet weak var BookLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        BookLabel.text = "Shit!!"
        BookImage.image = UIImage(named: "no_image")
    }

    func setTitle(_ title: String) {
        BookLabel.text = title
    }
}
