//
//  ViewController.swift
//  ios9.7.Constraints
//
//  Created by user on 23.06.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChildViewController(controller: storyboard!.instantiateViewController(identifier: "FirstViewController"))
    }

    private func setChildViewController(controller: UIViewController) {
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)

        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            controller.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            controller.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            controller.view.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -8)
        ])

        controller.didMove(toParent: self)
    }
    
    @IBAction func changeSegmantedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "FirstViewController"))
        case 1:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "SecondViewController"))
        case 2:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "ThirdViewController"))
        case 3:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "FourthViewController"))
        case 4:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "FifthViewController"))
        default:
            break
        }
    }
}

