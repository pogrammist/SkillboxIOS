//
//  WeatherLoader.swift
//  
//
//  Created by user on 12.08.2020.
//

import Foundation
import SVProgressHUD
import Alamofire

class WeatherLoader {
    func loadWeather(completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=255361a5257395ebde042ddfa8573ffd")!
        let request = URLRequest(url: url)
        //        SVProgressHUD.show()
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary {
                DispatchQueue.main.async {
                    let weather = jsonDict["main"] as! NSDictionary
                    
                    let currentWeather = Weather(data: weather)!
                    let currentHumidity = String(currentWeather.humidity)
                    let currentTempCels = Int(WeatherLoader.convertToCelsius(fahrenheit: currentWeather.temp))
                    let currentPressure = String(currentWeather.pressure)
                    
                    let weatherText = "Now in Moscow:\n" +
                        "Humidity: \(currentHumidity)\n" + "Temperature: \(currentTempCels)ºC\n" + "Pressure: \(currentPressure)"
                    
                    
                    completion(weatherText)
                    //                    SVProgressHUD.dismiss()
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
        //        SVProgressHUD.dismiss()
    }
    
    func loadWeatherDetail(completion: @escaping ([WeatherDetail]) ->Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=255361a5257395ebde042ddfa8573ffd")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary,
                let list = jsonDict["list"] as? [NSDictionary]{
                
                var weathers: [WeatherDetail] = []
                for data in list{
                    let weather = WeatherDetail(data: data)!
                    weathers.append(weather)
                }
                DispatchQueue.main.async {
                    completion(weathers)
                }
            }
        }
        task.resume()
    }
    
    func loadWeatherDetailAlamofire(completion: @escaping ([WeatherDetail]) ->Void) {
        AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=255361a5257395ebde042ddfa8573ffd").responseJSON{
            response in
            if let objects = response.value,
                let jsonDict = objects as? NSDictionary,
                let list = jsonDict["list"] as? [NSDictionary]{
                var weathers: [WeatherDetail] = []
                
                var weather:WeatherDetail
                for data in list{
                    weather = WeatherDetail(data: data)!
                    weathers.append(weather)
                }
                DispatchQueue.main.async {
                    completion(weathers)
                }
                
            }
        }
    }
}

extension WeatherLoader {
    static func convertToCelsius (fahrenheit: Double) -> Double {
        return Double ((5.0 / 9.0) * (Double (fahrenheit) - 32.0))
    }
}
