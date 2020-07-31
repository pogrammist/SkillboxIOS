//
//  ViewController.swift
//  ios10.7.TablesOnStoryboard
//
//  Created by user on 16.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sales"
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Product.allProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.imageView.image = Product.allProducts[indexPath.row].image
        cell.oldPriceLabel.text = String(Product.allProducts[indexPath.row].oldPrice)
        cell.priceLabel.text = String(Product.allProducts[indexPath.row].price)
        cell.titleLabel.text = Product.allProducts[indexPath.row].title
//        cell.data = Product.allProducts[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 10) / 2, height: collectionView.frame.width / 2)
    }
}
