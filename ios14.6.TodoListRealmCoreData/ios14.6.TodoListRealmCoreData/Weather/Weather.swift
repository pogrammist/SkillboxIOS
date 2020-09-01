//
//  Weather.swift
//  
//
//  Created by user on 12.08.2020.
//

import Foundation
import RealmSwift

class Weather: Object {
    @objc dynamic var humidity = Int()
    @objc dynamic var pressure = Int()
    @objc dynamic var temp = Double()
}

class WeatherDetail: Weather {
    @objc dynamic var dtTxt = String()
    @objc dynamic var speed = Double()
    @objc dynamic var main = String()
    
    override static func primaryKey() -> String? {
      return "dtTxt"
    }
}
