//
//  SetColorViewController.swift
//  ios7.7.UITabBarController
//
//  Created by user on 15.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

protocol SetColorDelegate {
    func setColor(_ color: String)
}

class SecondSetColorViewController: UIViewController {
    
    @IBOutlet weak var colorLabel: UILabel!
    
    var colorName = ""
    var delegate: SetColorDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.text = colorName
    }
    
    @IBAction func setColor(_ sender: UIButton) {
        switch sender.tag {
        case 10:
            putColor("Green")
        case 20:
            putColor("Blue")
        case 30:
            putColor("Pink")
        default:
            break
        }
    }
    
    func putColor(_ color: String) {
        colorLabel.text = color
        colorName = "Used \(color)"
        delegate?.setColor(colorName)
        navigationController?.popViewController(animated: true)
    }
}
