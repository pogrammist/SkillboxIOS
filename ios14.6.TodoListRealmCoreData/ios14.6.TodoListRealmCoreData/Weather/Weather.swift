//
//  Weather.swift
//  
//
//  Created by user on 12.08.2020.
//

import Foundation
import RealmSwift

class Weather: Object {
    @objc var humidity = Int()
    @objc var pressure = Int()
    @objc var temp = Double()
}

//class WeatherDetail: Object {
//    @objc let main: NSDictionary
//    @objc let dtTxt: String
//    @objc let wind: NSDictionary
//    @objc let weather: [NSDictionary]
//    
//    init?(data: NSDictionary) {
//        guard let dtTxt = data["dt_txt"] as? String,
//            let main = data["main"] as? NSDictionary,
//            let wind = data["wind"] as? NSDictionary,
//            let weather = data["weather"] as? [NSDictionary]
//            else {
//                return nil
//        }
//        self.dtTxt = dtTxt
//        self.main = main
//        self.wind = wind
//        self.weather = weather
//    }
//    
//    required init() {
//        fatalError("init() has not been implemented")
//    }
//}
