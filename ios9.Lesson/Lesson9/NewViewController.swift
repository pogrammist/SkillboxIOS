//
//  NewViewController.swift
//  Lesson9
//
//  Created by Nikita Arkhipov on 17.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
//        likeButton.isHidden = !likeButton.isHidden
        widthConstraint.constant += 20
        view.layoutIfNeeded()
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
