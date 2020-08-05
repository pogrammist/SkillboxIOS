//
//  ProductCell.swift
//  ios10.7.TablesOnStoryboard
//
//  Created by user on 16.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
//    var data: Product? {
//        didSet {
//            guard let data = data else { return }
//            imageView.image = data.image
//            oldPriceLabel.text = "\(data.oldPrice) .руб"
//            priceLabel.text = "\(data.price) .руб"
//            titleLabel.text = data.title
//        }
//    }
}
