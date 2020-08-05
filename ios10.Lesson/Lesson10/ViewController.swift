//
//  ViewController.swift
//  Lesson10
//
//  Created by Nikita Arkhipov on 17.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var names = ["Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTable(data: names)
        // Do any additional setup after loading the view.
    }

    func generateTable(data: [String]){
        for (index, name) in data.enumerated(){
            let y = CGFloat(index) * 80
            let cell = UIView(frame: CGRect(x: 0, y: y, width: view.frame.size.width, height: 80))
            if index % 2 == 0 { cell.backgroundColor = .lightGray }
            let label = UILabel(frame: cell.bounds)
            label.text = name
            cell.addSubview(label)
            scrollView.addSubview(cell)
        }
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: CGFloat(data.count) * 80)
    }

}

