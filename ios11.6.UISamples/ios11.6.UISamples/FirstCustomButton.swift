//
//  FirstCustomButton.swift
//  ios11.6.UISamples
//
//  Created by user on 06.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

@IBDesignable
class FirstCustomButton: UIButton {
    
    var isSetuped = false
    
    @IBInspectable var textLabel: String = "Button" {
        didSet {
            setTitle(textLabel, for: .normal)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 12 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var width: CGFloat = 100 {
        didSet {
            frame.size.width = width
        }
    }
    
    @IBInspectable var borderColor: UIColor = .darkGray
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupButton()
        
        if isSetuped { return }
        isSetuped = true
    }
    
    
    func setupButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        setTitle(textLabel, for: .normal)
        
        backgroundColor      = .blue
        titleLabel?.font     = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius   = cornerRadius
        layer.borderWidth    = 3.0
        layer.borderColor    = borderColor.cgColor
        contentEdgeInsets    = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        frame.size.width     = width
    }
    
    
    private func setShadow() {
        layer.shadowColor   = UIColor.blue.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    
    func shake() {
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
        let fromValue       = NSValue(cgPoint: fromPoint)
        
        let toPoint         = CGPoint(x: center.x + 8, y: center.y)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        layer.add(shake, forKey: "position")
    }
}
