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
//    var weathers: [WeatherDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        weatherDetailTableView.dataSource = self
//        let loader = WeatherLoader()
//
//        loader.loadWeatherDetailAlamofire { weathers in
//            self.weathers = weathers
//            self.weatherDetailTableView.reloadData()
//        }
    }
}

//extension WeatherDetailController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return weathers.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherDetailCell") as! WeatherDetailTableViewCell
//        let model = weathers[indexPath.row]
//        let tempKelvin: Double = model.main["temp"]! as! Double
//        let tempCels: Int = Int(WeatherLoader.convertToCelsius(fahrenheit: tempKelvin))
//
//        cell.dateLabel.text = model.dtTxt
//        cell.weatherLabel.text = "Temperature: \(tempCels)ºC\n" + "Pressure: \(model.main["pressure"]!)\n" + "Humidity: \(model.main["humidity"]!)\n" + "Wind speed: \(model.wind["speed"]!)m/s \n" + "\(model.weather[0]["main"]!)"
//
//        return cell
//    }
//}
