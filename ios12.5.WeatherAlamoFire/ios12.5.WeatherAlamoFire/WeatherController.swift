//
//  ViewController.swift
//  ios12.WeatherAlamoFire
//
//  Created by user on 12.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class WeatherController: UIViewController {
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader = WeatherLoader()
        
        loader.loadWeather { weather in
//            DispatchQueue.main.async {
                if let weather = weather{
                    self.weatherLabel.text = "\(weather)"}
                else{self.weatherLabel.text = "Error"}
//            }
        }
    }
}

