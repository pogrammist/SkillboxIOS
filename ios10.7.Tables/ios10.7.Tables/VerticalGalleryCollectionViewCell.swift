//
//  VerticalGalleryCollectionViewCell.swift
//  ios10.7.Tables
//
//  Created by user on 15.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class VerticalGalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "VerticalGalleryCollectionViewCell"
        
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let lbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.image = UIImage(named: "rocket")
            
        addSubview(lbl)
        lbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 300).isActive = true
        lbl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        lbl.text = "I can fly!"
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
