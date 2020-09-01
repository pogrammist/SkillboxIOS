//
//  ViewController.swift
//  Lesson7
//
//  Created by Nikita Arkhipov on 17.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var finalNameLabel: UILabel!
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    var blueVC: BlueViewController!
    var role = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func show(_ sender: Any) {
        if nameTextfield.text == "" { return }
        performSegue(withIdentifier: "showBlue", sender: sender)
//        let vc = storyboard!.instantiateViewController(identifier: "BlueVC")
//        let vc = UIStoryboard(name: "BlueStoryboard", bundle: nil).instantiateViewController(identifier: "Orange")
//        present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BlueViewController, segue.identifier == "showBlue"{
            vc.userName = nameTextfield.text!
            vc.delegate = self
        }
        
        if let vc = segue.destination as? BlueViewController, segue.identifier == "embedBlue"{
            blueVC = vc
            vc.delegate = self
        }
    }
    
    @IBAction func changedName(_ sender: Any) {
        blueVC.userName = nameTextfield.text!
        updateFinalLabel()
    }
    
    func updateFinalLabel(){
        finalNameLabel.text = "\(nameTextfield.text!), \(role)"
    }
}

extension ViewController: BlueViewControllerDelegate{
    func setRole(_ role: String){
        self.role = role
        updateFinalLabel()
    }
}
