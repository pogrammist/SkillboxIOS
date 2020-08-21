//
//  ViewController.swift
//  ios13.5.Animation
//
//  Created by user on 14.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    private var currentAnimation: Int = 1
    
    @IBOutlet weak var redBox: UIView!
    @IBOutlet weak var widthLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var yLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var xLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var currentAnimationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func animation() {
        switch currentAnimation {
        case 1:
            UIView.animate(withDuration: 0.8, delay: 0, options: .autoreverse, animations: {
                self.redBox.backgroundColor = .yellow
            }, completion: { [unowned self] _ in
                self.redBox.backgroundColor = .red
                }
            )
        case 2:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
                self.xLayoutConstraint.constant = self.view.frame.width / 2
                self.yLayoutConstraint.constant = self.view.frame.height / -2
                self.view.layoutIfNeeded()
            }, completion: { [unowned self] _ in
                self.xLayoutConstraint.constant = 0
                self.yLayoutConstraint.constant = -50
                self.view.layoutIfNeeded()
                }
            )
        case 3:
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                let animateOff = CABasicAnimation(keyPath: "cornerRadius")
                animateOff.fromValue = self.redBox.frame.size.width / 2
                animateOff.toValue = 0
                animateOff.duration = 1
                self.redBox.layer.add(animateOff, forKey: "cornerRadiusOff")
                self.redBox.layer.cornerRadius = 0
            }
            let animateOn = CABasicAnimation(keyPath: "cornerRadius")
            animateOn.fromValue = 0
            animateOn.toValue = redBox.frame.size.width / 2
            animateOn.duration = 1
            redBox.layer.add(animateOn, forKey: "cornerRadiusOn")
            redBox.layer.cornerRadius = redBox.frame.size.width / 2
            CATransaction.commit()
        case 4:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
                self.redBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }, completion: nil)
        case 5:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
                self.redBox.alpha = 0
            }, completion: { [unowned self] _ in
                self.redBox.alpha = 1
            })
        case 6:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
                self.widthLayoutConstraint.constant = self.view.frame.width
                self.view.layoutIfNeeded()
            }, completion: { [unowned self] _ in
                self.widthLayoutConstraint.constant = 200
                self.view.layoutIfNeeded()
                }
            )
        case 7:
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .curveEaseIn], animations: {
                self.redBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
            }, completion: nil)
        default:
            fatalError("number of animations required from 1 to 7")
        }
    }
    
    @IBAction func runCurrentAnimation(_ sender: Any) {
        animation()
    }
    
    @IBAction func previousAnimation(_ sender: Any) {
        currentAnimation = currentAnimation != 1 ? currentAnimation - 1 : currentAnimation
        currentAnimationButton.setTitle("\(currentAnimation)", for: .normal)
        animation()
    }
    
    @IBAction func nextAnimation(_ sender: Any) {
        currentAnimation = currentAnimation != 7 ? currentAnimation + 1 : currentAnimation
        currentAnimationButton.setTitle("\(currentAnimation)", for: .normal)
        animation()
    }
    
}

