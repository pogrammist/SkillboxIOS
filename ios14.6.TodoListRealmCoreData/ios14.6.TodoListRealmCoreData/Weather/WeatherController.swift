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
        showRealmWeather()
        showWeather()
    }
    
    func showWeather() {
        WeatherLoader.shared.loadWeather { weather in
            if let weather = weather {
                self.weatherLabel.text = "\(weather)"
                self.weatherLabel.textColor = .black
            } else {
                self.showRealmWeather()
            }
        }
    }
    
    func showRealmWeather() {
        weatherLabel.textColor = .red
        if let realmWeather = WeatherRealmPersistent.storage.weather {
            weatherLabel.text = "Sometime in Moscow:\n" +
                "Humidity: \(realmWeather.humidity)\n" + "Temperature: \(Int(realmWeather.temp))ºC\n" + "Pressure: \(realmWeather.pressure)"
        } else {
            weatherLabel.text = "The Internet connection appears to be offline"
        }
    }
}

