//
//  ViewController.swift
//  ios12.WeatherAlamoFire
//
//  Created by user on 12.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import SVProgressHUD

class WeatherController: UIViewController {
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let realmWeather = WeatherRealmPersistent.storage.weather {
            weatherLabel.text = "Sometime in Moscow:\n" +
                "Humidity: \(realmWeather.humidity)\n" + "Temperature: \(Int(realmWeather.temp))ºC\n" + "Pressure: \(realmWeather.pressure)"
            weatherLabel.textColor = .red
        }
        
        let loader = WeatherLoader()
        loader.loadWeather { weather in
            if let weather = weather {
                self.weatherLabel.text = "\(weather)"
                self.weatherLabel.textColor = .black
            } else {
                self.weatherLabel.text = "Error"
            }
        }
    }
}

