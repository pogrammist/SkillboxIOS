//
//  ViewController.swift
//  ios8.6.Gallery
//
//  Created by user on 18.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var images: [UIImage] = []
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...10 {
            images.append(UIImage(imageLiteralResourceName: "Image\(i)"))
        }
        imageView.image = images.first
    }

    @IBAction func nextButton(_ sender: Any) {
        counter = (counter + 1) % images.count
        imageView.image = images[counter]
    }
    @IBAction func prevButton(_ sender: Any) {
        counter = counter - 1 < 0 ? 0 : (counter - 1) % images.count
        imageView.image = images[counter]
    }
}

