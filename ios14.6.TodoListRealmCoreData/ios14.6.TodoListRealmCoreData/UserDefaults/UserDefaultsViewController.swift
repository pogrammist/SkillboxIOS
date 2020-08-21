//
//  UserDefaultsViewController.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 18.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class UserDefaultsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var familyNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        familyNameTextField.delegate = self

        nameTextField.text =  Persistance.shared.userName
        familyNameTextField.text = Persistance.shared.userFamilyName
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func typeName(_ sender: Any) {
        Persistance.shared.userName = nameTextField.text
    }
    
    @IBAction func typeFamilyName(_ sender: Any) {
        Persistance.shared.userFamilyName = familyNameTextField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        familyNameTextField.resignFirstResponder()
        return true
    }
}
