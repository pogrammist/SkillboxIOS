//
//  BlueViewController.swift
//  ios7.7.UITabBarController
//
//  Created by user on 15.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class FirstBlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: nil)
        dismiss(animated: true, completion: nil)
    }

}
