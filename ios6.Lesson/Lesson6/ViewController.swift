//
//  ViewController.swift
//  Lesson6
//
//  Created by Nikita Arkhipov on 17.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "Hello world from code"
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(<#T##animated: Bool##Bool#>)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func greet(_ sender: Any) {
        helloLabel.text = "Hello, \(nameTextfield.text!)"
    }
    
    deinit {
        
    }
}

