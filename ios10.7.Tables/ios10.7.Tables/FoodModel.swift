//
//  FoodModel.swift
//  ios10.7.Tables
//
//  Created by user on 15.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

struct FoodModel {
    var image: UIImage
    
    static func fetchFood() -> [FoodModel] {
        let firstItem = FoodModel(image: UIImage(named: "food01")!)
        let secondItem = FoodModel(image: UIImage(named: "food02")!)
        let threeItem = FoodModel(image: UIImage(named: "food03")!)
        let thirdItem = FoodModel(image: UIImage(named: "food04")!)
        let fouthItem = FoodModel(image: UIImage(named: "food05")!)
        return [firstItem, secondItem, threeItem, thirdItem, fouthItem]
    }
}

