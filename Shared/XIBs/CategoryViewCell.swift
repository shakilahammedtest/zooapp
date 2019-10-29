//
//  CategoryViewCell.swift
//  Artable
//
//  Created by Ashraf Ahmed on 29/10/19.
//  Copyright © 2019 Shakil Ahammed. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    @IBOutlet weak var parentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.categoryImg.layer.cornerRadius = 10
    }
    
    
    func configureCell(category: Category) {
        categoryNameLabel.text = category.name
        if let imgUrl = URL(string: category.imgUrl) {
            categoryImg.kf.setImage(with: imgUrl)
        }
    }

}
