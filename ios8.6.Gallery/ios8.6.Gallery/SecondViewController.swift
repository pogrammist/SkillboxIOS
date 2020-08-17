//
//  SecondViewController.swift
//  ios8.6.Gallery
//
//  Created by user on 18.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...4 {
            let imageView = UIImageView(frame: CGRect(x: i % 2 == 1 ? 40 : 230,
                                                      y: i > 2 ? 250 : 50,
                                                      width: 150,
                                                      height: 150))
            imageView.image = UIImage(imageLiteralResourceName: "Image\(i)")
            let label = UILabel(frame: CGRect(x: imageView.frame.minX,
                                              y: imageView.frame.maxY + 10,
                                              width: imageView.frame.width,
                                              height: 20))
            label.textAlignment = .center
            label.text = "Image\(i)"
            view.addSubview(imageView)
            view.addSubview(label)
        }
    }
}
