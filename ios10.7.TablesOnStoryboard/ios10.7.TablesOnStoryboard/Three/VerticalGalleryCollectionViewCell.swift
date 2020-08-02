//
//  VerticalGalleryCollectionViewCell.swift
//  ios10.7.TablesOnStoryboard
//
//  Created by user on 31.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class VerticalGalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    
    var data: Food? {
        didSet {
            guard let data = data else { return }
            foodImage.image = data.image
        }
    }
}
