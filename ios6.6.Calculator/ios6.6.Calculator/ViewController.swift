//
//  ViewController.swift
//  ios6.6.Calculator
//
//  Created by user on 15.05.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var operation: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    
    var firstInt: Double = 0
    var secondInt: Double = 0
    var operationTrue: Bool = false
    
    @IBAction func firstNumberEditingDidChanged(_ sender: Any) {
        checkInput(input: firstNumber.text!)
    }
    
    @IBAction func secondNumberEditingDidChanged(_ sender: Any) {
        checkInput(input: secondNumber.text!)
    }
    
    @IBAction func operatorEditingDidChanged(_ sender: Any) {
        switch operation.text {
        case "+", "-", "*", "/":
            result.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            result.text = operation.text
            operationTrue = true
        default:
            result.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            result.text = "type operator, please"
            operationTrue = false
        }
    }
    
    @IBAction func calculate(_ sender: Any) {
        if operationTrue == true {
            switch operation.text {
            case "+":
                operationWithTwoOperands{$0 + $1}
            case "-":
                operationWithTwoOperands{$0 - $1}
            case "*":
                operationWithTwoOperands{$0 * $1}
            case "/":
                operationWithTwoOperands{$0 / $1}
            default:
                result.text = "error"
            }
        }
    }
    
    func operationWithTwoOperands(operation: (Double,Double) -> Double) {
        let x = Double(firstNumber.text!)
        let y = Double(secondNumber.text!)
        result.text = String(operation(x!, y!))
    }
    
    func checkInput(input: String) {
        if let number = Int(input) {
            result.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            result.text = String(number)
        } else {
            result.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            result.text = "type integer number, please"
        }
    }
}
