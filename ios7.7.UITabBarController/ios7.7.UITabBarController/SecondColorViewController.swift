//
//  ColorViewController.swift
//  ios7.7.UITabBarController
//
//  Created by user on 15.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SecondColorViewController: UIViewController {
    
    private var colorName = ""
    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondSetColorViewController, segue.identifier == "SetColor" {
            vc.colorName = colorLabel.text!
            vc.delegate = self
        }
    }
}

extension SecondColorViewController: SetColorDelegate {
    func setColor(_ color: String) {
        colorLabel.text = color
    }
}
