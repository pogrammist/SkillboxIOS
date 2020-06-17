//
//  ThreeSetColorViewController.swift
//  ios7.7.UITabBarController
//
//  Created by user on 17.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

protocol SetVBColorDelegate {
    func setColor(_ color: UIColor)
}

class ThreeSetColorViewController: UIViewController {
    
    var colorVB: UIColor? = nil {
        didSet { view.backgroundColor = colorVB }
    }
    var delegate: SetVBColorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func returnColor(_ sender: UIButton) {
        switch sender.tag {
        case 100:
            delegate?.setColor(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case 200:
            delegate?.setColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        case 300:
            delegate?.setColor(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        default:
            break
        }
    }
}
