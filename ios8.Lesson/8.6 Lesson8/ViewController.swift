//
//  ViewController.swift
//  Lesson6
//
//  Created by Nikita Arkhipov on 17.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    let newView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        redView.backgroundColor = UIColor.green
//        redView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        redView.alpha = 0.3
        redView.clipsToBounds = true
//        redView.isHidden = true
        
        print(redView.subviews)
        
        newView.backgroundColor = UIColor.purple
        redView.addSubview(newView)
        
        print(redView.subviews)
        
        
        //-----
        textLabel.text = "Hello from code!"
        textLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textLabel.textColor = .red
        textLabel.font = UIFont.systemFont(ofSize: 10)
        
        //-----
        logoImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
//        logoImageView.image = nil
        logoImageView.backgroundColor = .green
        
        //-----
        nameTextfield.textColor = .red
        nameTextfield.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        nameTextfield.textColor = .blue
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        newView.removeFromSuperview()
    }

    @IBAction func nameChanged(_ sender: Any) {
        textLabel.text = "Hello, \(nameTextfield.text!)"
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "a" || string == "o" { return false }
        return true
    }
}
