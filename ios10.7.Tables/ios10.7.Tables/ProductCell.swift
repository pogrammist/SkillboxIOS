//
//  ProductCell.swift
//  ios10.7.Tables
//
//  Created by user on 09.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

    var data: Product? {
        didSet {
            guard let data = data else { return }
            iv.image = data.image
            oldPriceLabel.attributedText = "\(data.oldPrice) .руб".strikeThrough()
            priceLabel.text = "\(data.price) .руб"
        }
    }
    
    fileprivate let v: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 12
        v.backgroundColor = .systemPink
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor.gray.cgColor
        return v
    }()
    
    fileprivate let iv: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 6
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.gray.cgColor
        return iv
    }()
    
    fileprivate let oldPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(10)
        return label
    }()
    
    fileprivate let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        v.addSubview(priceLabel)
        priceLabel.leftAnchor.constraint(equalTo: v.leftAnchor, constant: 6).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -6).isActive = true
        
        v.addSubview(oldPriceLabel)
        oldPriceLabel.leftAnchor.constraint(equalTo: v.leftAnchor, constant: 6).isActive = true
        oldPriceLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor).isActive = true

        v.addSubview(iv)
        iv.topAnchor.constraint(equalTo: v.topAnchor, constant: 6).isActive = true
        iv.leftAnchor.constraint(equalTo: v.leftAnchor, constant: 6).isActive = true
        iv.rightAnchor.constraint(equalTo: v.rightAnchor, constant: -6).isActive = true
        iv.bottomAnchor.constraint(equalTo: oldPriceLabel.topAnchor, constant: -6).isActive = true
        
        contentView.addSubview(v)
        v.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        v.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        v.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        v.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
               value: NSUnderlineStyle.single.rawValue,
                   range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
