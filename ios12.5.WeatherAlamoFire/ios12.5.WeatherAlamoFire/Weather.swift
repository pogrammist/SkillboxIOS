//
//  Weather.swift
//  
//
//  Created by user on 12.08.2020.
//

import Foundation

class Weather {
    let humidity: Int
    let pressure: Int
    var temp:Double
    
    init?(data: NSDictionary) {
        guard let humidity = data["humidity"] as? Int,
            let temp = data["temp"] as? Double,
            let pressure = data["pressure"] as? Int
            else { return nil }
        self.humidity = humidity
        self.temp = temp
        self.pressure = pressure
    }
}

class WeatherDetail {
    let main: NSDictionary
    let dtTxt: String
    let wind: NSDictionary
    let weather: [NSDictionary]
    
    init?(data: NSDictionary) {
        guard let dtTxt = data["dt_txt"] as? String,
            let main = data["main"] as? NSDictionary,
            let wind = data["wind"] as? NSDictionary,
            let weather = data["weather"] as? [NSDictionary]
            else {
                return nil
        }
        self.dtTxt = dtTxt
        self.main = main
        self.wind = wind
        self.weather = weather
    }
}
