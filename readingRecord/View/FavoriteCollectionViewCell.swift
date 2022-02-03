//
//  FavoriteCollectionViewCell.swift
//  readingRecord
//
//  Created by 坂井孝輔 on 2021/09/04.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.backgroundColor = .gray
    }

    func setText(_ text: String) {
        label.text = text
    }
    
    func setImage(_ image: String) {
        bookImage.image = UIImage(named: image)
    }
}
