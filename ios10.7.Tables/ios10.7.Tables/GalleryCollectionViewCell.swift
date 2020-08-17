//
//  GalleryCollectionViewCell.swift
//  ios10.7.Tables
//
//  Created by user on 15.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl ()
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
