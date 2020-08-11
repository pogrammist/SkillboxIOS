//
//  ViewController.swift
//  ios11.6.UISamples
//
//  Created by user on 03.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

@IBDesignable class ViewController: UIViewController {
    
    @IBOutlet weak var button: FirstCustomButton!
    @IBOutlet weak var customSegmentControl: ThreeSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSegmentControl.delegate = self
    }

    @IBAction func useButton(_ sender: FirstCustomButton) {
        button.shake()
    }
}

extension ViewController: ThreeSegmentedControlDelegate {
    func presedSelectedItem(_ selectedItem: UIButton) {
        print(selectedItem.titleLabel!)
    }
}
