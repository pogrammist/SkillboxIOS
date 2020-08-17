//
//  ViewController.swift
//  Lesson13
//
//  Created by Nikita Arkhipov on 18.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var menuTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    var isMenuOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeState(_ sender: Any) {
        isMenuOpened = !isMenuOpened
//        UIView.animate(withDuration: 0.3) {
//            self.menuView.frame.size.height = self.isMenuOpened ? 150 : 50
////            self.menuView.alpha = self.isMenuOpened ? 1 : 0
//            self.menuView.backgroundColor = self.isMenuOpened ? .green : .gray
//
//        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                        self.menuView.backgroundColor = self.isMenuOpened ? .green : .gray

        }) { isCompeted in
            print("Completed animation")
        }
    }
    
    @IBAction func linear(_ sender: Any) {
//        animate(options: .curveLinear)
        animateSpring(dumping: 0.8, velocity: 0)
    }
    
    @IBAction func inOut(_ sender: Any) {
//        animate(options: .curveEaseInOut)
        animateSpring(dumping: 0.4, velocity: 0)
    }
        
    @IBAction func inAnimation(_ sender: Any) {
//        animate(options: .curveEaseIn)
        animateSpring(dumping: 1, velocity: 0)
    }
    
    @IBAction func outAnimation(_ sender: Any) {
//        animate(options: .curveEaseOut)
        animateSpring(dumping: 0.4, velocity: 0.6)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
//        let animation = CABasicAnimation(keyPath: "cornerRadius")
//        animation.fromValue = NSNumber(value: 0)
//        animation.toValue = NSNumber(value: 75)
//        animation.duration = 1.0
//        yellowView.layer.add(animation, forKey: "cornerRadius")
//        yellowView.layer.cornerRadius = 75
        
//        yellowView.layer.shadowColor = UIColor.black.cgColor
//        yellowView.layer.shadowOpacity = 0.7
//        let animation = CABasicAnimation(keyPath: "shadowRadius")
//        animation.fromValue = NSNumber(value: 0)
//        animation.toValue = NSNumber(value: 10)
//        animation.duration = 1.0
//        yellowView.layer.add(animation, forKey: "shadowRadius")
//        yellowView.layer.shadowRadius = 10
        
        UIView.animate(withDuration: 0.3) {
            self.yellowView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        
    }
    
    func animate(options: UIView.AnimationOptions){
        self.menuView.frame.origin.y = 20
        UIView.animate(withDuration: 0.8, delay: 0, options: [options, .repeat, .autoreverse], animations: {
        self.menuView.frame.origin.y = 400
        }) { isCompeted in
            print("Completed animation")
        }
    }
    
    func animateSpring(dumping: CGFloat, velocity: CGFloat){
//        self.menuView.frame.origin.y = 20
        menuTopConstraint.constant = 0
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: dumping, initialSpringVelocity: velocity, options: UIView.AnimationOptions(), animations: {
//            self.menuView.frame.origin.y = 400
            self.menuTopConstraint.constant = 400
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}

