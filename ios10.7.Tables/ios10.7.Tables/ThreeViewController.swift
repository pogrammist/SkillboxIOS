//
//  ThreeViewController.swift
//  ios10.7.Tables
//
//  Created by user on 14.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    private var galleryCollectionView = GalleryCollectionView()
    private var verticalGalleryCollectionView = VerticalGalleryCollectionView()
    private var whiteView = UIView()
    private var redCub = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.backgroundColor = .magenta
        
        scrollView.addSubview(galleryCollectionView)
        galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        galleryCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        galleryCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        galleryCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        galleryCollectionView.backgroundColor = .orange
        galleryCollectionView.set(cells: FoodModel.fetchFood())
        
        scrollView.addSubview(verticalGalleryCollectionView)
        verticalGalleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        verticalGalleryCollectionView.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor, constant: -10).isActive = true
        verticalGalleryCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        verticalGalleryCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        verticalGalleryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        verticalGalleryCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        verticalGalleryCollectionView.set(cells: FoodModel.fetchFood())
        verticalGalleryCollectionView.backgroundColor = .red
        verticalGalleryCollectionView.layer.cornerRadius = 16
        
    }
}
