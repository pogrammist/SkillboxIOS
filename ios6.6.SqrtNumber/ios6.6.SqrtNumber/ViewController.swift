//
//  ViewController.swift
//  ios6.6.SqrtNumber
//
//  Created by user on 14.05.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func textFieldEditingDidChange(_ sender: Any) {
        if let number = Int(textField.text!) {
            label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            label.text = String(pow(Double(number), 2.0))
        } else {
            label.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            label.text = "type integer number, please"
        }
    }
}

