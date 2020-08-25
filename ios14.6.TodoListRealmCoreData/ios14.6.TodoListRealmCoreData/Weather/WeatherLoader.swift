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
    static let shared = WeatherLoader()
    
    func loadWeather(completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=255361a5257395ebde042ddfa8573ffd")!
        let request = URLRequest(url: url)
        SVProgressHUD.show()
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary {
                
                let weather = jsonDict["main"] as! NSDictionary
                guard let currentHumidity = weather["humidity"] as? Int,
                    let currentPressure = weather["pressure"] as? Int,
                    let currentTempCels = weather["temp"] as? Double else { return }
                
                let currentWeather = WeatherMain()
                currentWeather.humidity = currentHumidity
                currentWeather.pressure = currentPressure
                currentWeather.temp = WeatherLoader.convertToCelsius(fahrenheit: currentTempCels)
                
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    WeatherRealmPersistent.storage.addWeather(weather: currentWeather)
                    let weatherText = "Now in Moscow:\n" +
                        "Humidity: \(currentHumidity)\n" + "Temperature: \(currentTempCels)ºC\n" + "Pressure: \(currentPressure)"
                    completion(weatherText)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    //    func loadWeatherDetail(completion: @escaping ([WeatherDetail]) ->Void) {
    //        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=255361a5257395ebde042ddfa8573ffd")!
    //        let request = URLRequest(url: url)
    //        SVProgressHUD.show()
    //        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    //            if let data = data,
    //                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
    //                let jsonDict = json as? NSDictionary,
    //                let list = jsonDict["list"] as? [NSDictionary]{
    //
    //                var weathers: [WeatherDetail] = []
    //                for data in list{
    //                    let weather = WeatherDetail(data: data)!
    //                    weathers.append(weather)
    //                }
    //                DispatchQueue.main.async {
    //                    SVProgressHUD.dismiss()
    //                    completion(weathers)
    //                }
    //            }
    //        }
    //        task.resume()
    //    }
    //
    func loadWeatherDetailAlamofire(completion: @escaping ([WeatherDetail]) ->Void) {
        SVProgressHUD.show()
        AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=255361a5257395ebde042ddfa8573ffd").responseJSON{
            response in
            if let objects = response.value,
                let jsonDict = objects as? NSDictionary,
                let list = jsonDict["list"] as? [NSDictionary] {
                
                var weathers: [WeatherDetail] = []
                
                for data in list {
                    guard let dtTxt = data["dt_txt"] as? String,
                        let main = data["main"] as? NSDictionary,
                        let wind = data["wind"] as? NSDictionary,
                        let weather = data["weather"] as? [NSDictionary] else { return }
                    
                    let dataMain = WeatherMain()
                    guard let humidity = main["humidity"] as? Int,
                        let pressure = main["pressure"] as? Int,
                        let tempCels = main["temp"] as? Double else { return }
                    dataMain.humidity = humidity
                    dataMain.pressure = pressure
                    dataMain.temp = WeatherLoader.convertToCelsius(fahrenheit: tempCels)
                    
                    let dataWind = Wind()
                    guard let speed = wind["speed"] as? Double else { return }
                    dataWind.speed = speed
                    
                    let dataWeather = Weather()
                    guard let mn = weather[0]["main"] as? String else { return }
                    dataWeather.main = mn
                    
                    let weatherDetail = WeatherDetail()
                    weatherDetail.dtTxt = dtTxt
                    weatherDetail.main = dataMain
                    weatherDetail.wind = dataWind
                    weatherDetail.weather = dataWeather
                    weathers.append(weatherDetail)
                }
                
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    WeatherRealmPersistent.storage.addWeatherDetail(weathers: weathers)
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
