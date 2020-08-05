//
//  Product.swift
//  ios10.7.TablesOnStoryboard
//
//  Created by user on 16.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

struct Food {
    let image: UIImage?
}

extension Food {
    static var allFoods: [Food] {
        return [
            Food(image: UIImage(named: "food01")),
            Food(image: UIImage(named: "food02")),
            Food(image: UIImage(named: "food03")),
            Food(image: UIImage(named: "food04")),
            Food(image: UIImage(named: "food05"))
        ]
    }
}
