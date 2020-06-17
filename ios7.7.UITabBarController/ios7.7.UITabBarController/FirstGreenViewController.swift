//
//  GreenViewController.swift
//  ios7.7.UITabBarController
//
//  Created by user on 15.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class FirstGreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ShowPink(_ sender: Any) {
        performSegue(withIdentifier: "ShowPink", sender: nil)
    }
    
    @IBAction func BlueShow(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(identifier: "FirstBlueController")
        present(vc, animated: true, completion: nil)
    }
}
