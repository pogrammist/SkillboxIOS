//
//  VerticalGalleryCollectionView.swift
//  ios10.7.Tables
//
//  Created by user on 15.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class VerticalGalleryCollectionView: UICollectionView {
    
    var cells = [FoodModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)

        register(VerticalGalleryCollectionViewCell.self, forCellWithReuseIdentifier: VerticalGalleryCollectionViewCell.reuseId)
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blue
        
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

extension VerticalGalleryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
            
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: VerticalGalleryCollectionViewCell.reuseId, for: indexPath) as! VerticalGalleryCollectionViewCell
        return cell
    }
            
}

extension VerticalGalleryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 2)
    }
}
