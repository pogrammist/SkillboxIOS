//
//  CategoriesLoader.swift
//  Lesson12
//
//  Created by Nikita Arkhipov on 18.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import Foundation
//import SVProgressHUD
import Alamofire

protocol CategoriesLoaderDelegate {
    func loaded(categories: [Category])
}

class CategoriesLoader{
//    var delegate: CategoriesLoaderDelegate?
    
    func loadCategories(completion: @escaping ([Category]) -> Void){
        let url = URL(string: "https://blackstarshop.ru/index.php?route=api/v1/categories")!
        let request = URLRequest(url: url)
//        SVProgressHUD.setBorderColor(.green)
//        SVProgressHUD.show()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary{
                DispatchQueue.main.async {
                    var categories: [Category] = []
                    
                    for (_, data) in jsonDict where data is NSDictionary{
                        if let category = Category(data: data as! NSDictionary){
                            categories.append(category)
                        }
                    }
                    //более изящный способ вместо строчек 25-31:
                    //                let categories = jsonDict.compactMap { _, v in v as? NSDictionary }
                    //                    .compactMap(Category.init)
                    
//                    self.delegate?.loaded(categories: categories)
                    completion(categories)
//                    SVProgressHUD.dismiss()
                }
                
            }
        }
        task.resume()
    }
    
    func loadCategories2(completion: @escaping ([Category]) -> Void){
//        SVProgressHUD.show()
        AF.request("https://blackstarshop.ru/index.php?route=api/v1/categories").responseJSON { response in
            if let objects = response.value,
                let jsonDict = objects as? NSDictionary{
                                DispatchQueue.main.async {
                                    var categories: [Category] = []
                                    
                                    for (_, data) in jsonDict where data is NSDictionary{
                                        if let category = Category(data: data as! NSDictionary){
                                            categories.append(category)
                                        }
                                    }
                                    //более изящный способ вместо строчек 25-31:
                                    //                let categories = jsonDict.compactMap { _, v in v as? NSDictionary }
                                    //                    .compactMap(Category.init)
                                    
                //                    self.delegate?.loaded(categories: categories)
                                    completion(categories)
//                                    SVProgressHUD.dismiss()
                }

            }
        }
    }
}
