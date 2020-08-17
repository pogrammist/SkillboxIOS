//
//  ViewController.swift
//  Lesson12
//
//  Created by Nikita Arkhipov on 17.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testView = TestView.loadFrimNIB()
        testView.delegate = self
        view.addSubview(testView)
        // Do any additional setup after loading the view.
    }


}

extension ViewController: TestViewDelegate{
    func testViewPressed(_ testView: TestView) {
        print("pressed test view")
    }
}
