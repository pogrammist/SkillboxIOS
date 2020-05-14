//
//  ViewController.swift
//  ios6.6.ActionShowFromArray
//
//  Created by user on 14.05.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array: Array<String> = []
    
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var addTextField: UITextField!
    @IBAction func action(_ sender: Any) {
        if (addTextField.text?.count == 0) {
            showLabel.text = "Try type again"
        } else {
        addMessage(input: addTextField.text!)
        showMessage()
        }
    }
    
    func addMessage(input: String) {
        array.append(input)
    }
    
    func showMessage() {
        addTextField.text = ""
        showLabel.text = array.joined(separator: " ")
    }
}
