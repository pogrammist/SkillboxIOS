//
//  Product.swift
//  ios10.7.TablesOnStoryboard
//
//  Created by user on 16.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

struct Product {
    let title: String
    let oldPrice: Int
    let price: Int
    let image: UIImage?
}

extension Product {
    static var allProducts: [Product] {
        return [
            Product(title: "тайтсы", oldPrice: 10000, price: 7500, image: UIImage(named: "image01")),
            Product(title: "тайтсы", oldPrice: 90000, price: 6500, image: UIImage(named: "image02")),
            Product(title: "тайтсы", oldPrice: 80000, price: 5500, image: UIImage(named: "image03")),
            Product(title: "тайтсы", oldPrice: 70000, price: 4500, image: UIImage(named: "image04")),
            Product(title: "тайтсы", oldPrice: 60000, price: 3500, image: UIImage(named: "image01")),
            Product(title: "тайтсы", oldPrice: 50000, price: 2500, image: UIImage(named: "image02")),
            Product(title: "тайтсы", oldPrice: 40000, price: 1500, image: UIImage(named: "image03")),
            Product(title: "тайтсы", oldPrice: 30000, price: 500, image: UIImage(named: "image04"))
        ]
    }
}
