//
//  ThreeViewController.swift
//  ios10.7.Tables
//
//  Created by user on 14.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {
    
    @IBOutlet weak var horizontalGalleryCollectionView: UICollectionView!
    @IBOutlet weak var verticalGalleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Food"
        navigationController?.isNavigationBarHidden = true
        
        horizontalGalleryCollectionView.delegate = self
        horizontalGalleryCollectionView.dataSource = self
        
        verticalGalleryCollectionView.delegate = self
        verticalGalleryCollectionView.dataSource = self
    }
}

extension ThreeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == horizontalGalleryCollectionView) {
            return CGSize(width: horizontalGalleryCollectionView.frame.width, height: horizontalGalleryCollectionView.frame.height)
        } else {
            return CGSize(width: verticalGalleryCollectionView.frame.width, height: verticalGalleryCollectionView.frame.height)
        }
    }
}

extension ThreeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == horizontalGalleryCollectionView) {
            return Food.allFoods.count
        } else {
            return 3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == horizontalGalleryCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCell", for: indexPath) as! HorizontalGalleryCollectionViewCell
            cell.data = Food.allFoods[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalCell", for: indexPath) as! VerticalGalleryCollectionViewCell
            cell.data = Food.allFoods[indexPath.row]
            return cell
        }
        
    }
}
