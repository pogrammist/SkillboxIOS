//
//  FirstButton.swift
//  ios11.6.UISamples
//
//  Created by user on 03.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class FirstButton: UIButton {
    
    var isSetuped = false
    
    @IBInspectable var width: CGFloat = 100 {
        didSet {
            self.frame.size.width = self.width
            centerXAnchor.constraint(equalTo: safeAreaLayoutGuide .centerXAnchor).isActive = true
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .green
    
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable var titleText: String = "Button" {
        didSet {
            self.setTitle(titleText, for: .normal)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame.size.width = self.width
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.cornerRadius = self.cornerRadius
        self.setTitle(titleText, for: .normal)
        
        if isSetuped { return }
        isSetuped = true
    }
}
