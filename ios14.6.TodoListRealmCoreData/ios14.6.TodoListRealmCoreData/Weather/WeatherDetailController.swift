//
//  WeatherDetailController.swift
//  ios12.WeatherAlamoFire
//
//  Created by user on 12.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class WeatherDetailController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var weatherDetailTableView: UITableView!
    var weathers: [WeatherDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherDetailTableView.dataSource = self
        
        showRealmWeather()
        showWeather()
    }
    
    func showWeather() {
        WeatherLoader.shared.loadWeatherDetailAlamofire { weathers in
            if weathers.isEmpty {
                self.showRealmWeather()
            } else {
                self.weathers = weathers
                self.weatherDetailTableView.separatorColor = .lightGray
                self.weatherDetailTableView.reloadData()
            }
        }
    }
    
    func showRealmWeather() {
        weathers = WeatherRealmPersistent.storage.weathers
        weatherDetailTableView.separatorColor = .red
        weatherDetailTableView.reloadData()
    }
}

extension WeatherDetailController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherDetailCell") as! WeatherDetailTableViewCell
        let data = weathers[indexPath.row]
        
        let temp: Int = Int(data.temp)
        let pressure = data.pressure
        let humidity = data.humidity
        let speed = data.speed
        let weather = data.main
        
        cell.dateLabel.text = data.dtTxt
        cell.weatherLabel.text = "Temperature: \(temp)ºC\n" + "Pressure: \(pressure)\n" + "Humidity: \(humidity)\n" + "Wind speed: \(speed)m/s \n" + "\(weather)"
        return cell
    }
}
