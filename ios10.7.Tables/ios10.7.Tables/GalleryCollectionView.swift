//
//  GalleryCollectionView.swift
//  ios10.7.Tables
//
//  Created by user on 15.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class GalleryCollectionView: UICollectionView {
    
    var cells = [FoodModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)

        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green

        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set (cells: [FoodModel]) {
        self.cells = cells
    }
}

extension GalleryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return cells.count
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.imageView.image = cells[indexPath.row].image
        cell.pageControl.numberOfPages = cells.count
        cell.pageControl.currentPage = indexPath.row
        return cell
    }
        
}

extension GalleryCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
