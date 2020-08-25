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
        
        weathers = WeatherRealmPersistent.storage.weathers
        print(weathers.count)
        weatherDetailTableView.reloadData()
        
        WeatherLoader.shared.loadWeatherDetailAlamofire { weathers in
            self.weathers = weathers
            self.weatherDetailTableView.reloadData()
        }
    }
}

extension WeatherDetailController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherDetailCell") as! WeatherDetailTableViewCell
        let model = weathers[indexPath.row]
        
        let tempKelvin: Double = model.main?["temp"] as? Double ?? 0.0
        let tempCels: Int = Int(WeatherLoader.convertToCelsius(fahrenheit: tempKelvin))
        let pressure = model.main?["pressure"] as? Int ?? 0
        let humidity = model.main?["humidity"] as? Int ?? 0
        let speed = model.wind?["speed"] as? Double ?? 0.0
        let weather = model.weather?["main"] as? String ?? ""
        
        cell.dateLabel.text = model.dtTxt
        cell.weatherLabel.text = "Temperature: \(tempCels)ºC\n" + "Pressure: \(pressure)\n" + "Humidity: \(humidity)\n" + "Wind speed: \(speed)m/s \n" + "\(weather)"
        return cell
    }
}
