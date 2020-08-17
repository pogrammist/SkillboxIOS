//
//  ThreeViewController.swift
//  ios8.6.Gallery
//
//  Created by user on 18.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ThreeViewControler: UIViewController {
    
    var segmentControl = UISegmentedControl()
    var views: [UIView] = []
    var segmentItems = ["First","Second","Three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v1 = UIView()
        v1.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
        v1.backgroundColor = .green
        let tf1 = UITextField(frame: CGRect(x: 50, y: 300, width: 300, height: 30))
        tf1.backgroundColor = .white
        tf1.placeholder = "text"
        let tf2 = UITextField(frame: CGRect(x: 50, y: 400, width: 300, height: 30))
        tf2.backgroundColor = .white
        tf2.placeholder = "text"
        v1.addSubview(tf1)
        v1.addSubview(tf2)
        views.append(v1)
        
        let v2 = UIView()
        v2.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
        v2.backgroundColor = .blue
        let b1 = UIButton(frame: CGRect(x: 50, y: 300, width: 300, height: 30))
        b1.backgroundColor = .white
        b1.setTitle("Button Title", for: .normal)
        let b2 = UIButton(frame: CGRect(x: 50, y: 400, width: 300, height: 30))
        b2.backgroundColor = .white
        b2.setTitle("Button Title", for: .normal)
        v2.addSubview(b1)
        v2.addSubview(b2)
        views.append(v2)
        
        let v3 = UIView()
        v3.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
        v3.backgroundColor = .purple
        let iv1 = UIImageView(frame: CGRect(x: 50, y: 300, width: 300, height: 300))
        iv1.image = UIImage(imageLiteralResourceName: "Image1")
        v3.addSubview(iv1)
        views.append(v3)
        
        view.addSubview(views[0])
        
        segmentControl = UISegmentedControl(items: segmentItems)
        segmentControl.isMomentary = true
        segmentControl.frame = CGRect(x: 100, y: 700, width: 200, height: 30)
        view.addSubview(segmentControl)
        
        segmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
    @objc private func selectedValue(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            view.addSubview(views[segmentIndex])
            view.addSubview(segmentControl)
        }
    }
}
