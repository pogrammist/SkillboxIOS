//
//  FifthViewController.swift
//  ios9.7.Constraints
//
//  Created by user on 23.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var showSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        leftTextField.text = leftLabel.text
        rightTextField.text = rightLabel.text
    }
    
    @IBAction func typeLeftTextField(_ sender: Any) {
        leftLabel.text = leftTextField.text
    }
    
    @IBAction func typeRightTextField(_ sender: Any) {
        rightLabel.text = rightTextField.text
    }
    
    @IBAction func changeSwitch(_ sender: Any) {
        if showSwitch.isOn {
            textLabel.numberOfLines = 0
        } else {
            textLabel.numberOfLines = 5
        }
    }
}
