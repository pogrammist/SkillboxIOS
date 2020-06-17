//
//  ThreeColorViewController.swift
//  ios7.7.UITabBarController
//
//  Created by user on 17.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ThreeColorViewController: UIViewController {
    
    private var embeddedVC: ThreeSetColorViewController?
    private var colorVB: UIColor? = nil {
        didSet { view.backgroundColor = colorVB }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ThreeSetColorViewController, segue.identifier == "SendColor" {
            vc.delegate = self
            embeddedVC = vc
        }
    }
    
    @IBAction func setColor(_ sender: UIButton) {
        switch sender.tag {
        case 10:
            embeddedVC?.colorVB = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case 20:
            embeddedVC?.colorVB = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        case 30:
            embeddedVC?.colorVB = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        default:
            break
        }
    }
}

extension ThreeColorViewController: SetVBColorDelegate {
    func setColor(_ color: UIColor) {
        colorVB = color
    }
}
