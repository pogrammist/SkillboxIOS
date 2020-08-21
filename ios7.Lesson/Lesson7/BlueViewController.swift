//
//  BlueViewController.swift
//  Lesson7
//
//  Created by Nikita Arkhipov on 17.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

protocol BlueViewControllerDelegate {
    func setRole(_ role: String)
}

class BlueViewController: UIViewController {

    var userName = ""{
        didSet { nameLabel.text = userName }
    }
    
    var delegate: BlueViewControllerDelegate?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello, i'm showed")
        nameLabel.text = userName
        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        delegate?.setRole(roleTextfield.text!)
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func textChanged(_ sender: Any) {        delegate?.setRole(roleTextfield.text!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
