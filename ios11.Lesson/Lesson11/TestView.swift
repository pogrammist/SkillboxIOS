//
//  TestView.swift
//  Lesson12
//
//  Created by Nikita Arkhipov on 17.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

protocol TestViewDelegate: NSObjectProtocol {
    func testViewPressed(_ testView: TestView)
}

class TestView: UIView {
    
    @IBOutlet weak var testLabel: UILabel!
    
    weak var delegate: TestViewDelegate?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    @IBAction func testPressed(_ sender: Any) {
        delegate?.testViewPressed(self)
    }
    
    
    static func loadFrimNIB() -> TestView{
        let nib = UINib(nibName: "TestView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! TestView
    }
}
