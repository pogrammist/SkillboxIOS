//
//  Weather.swift
//  
//
//  Created by user on 12.08.2020.
//

import Foundation
import RealmSwift

class Weather: Object {
    @objc dynamic var id = 0
    @objc dynamic var humidity = Int()
    @objc dynamic var pressure = Int()
    @objc dynamic var temp = Double()
    
    override static func primaryKey() -> String? {
      return "id"
    }
}

class WeatherDetail: Object {
    @objc var dtTxt = String()
    @objc var humidity = Int()
    @objc var pressure = Int()
    @objc var temp = Double()
    @objc var speed = Double()
    @objc var main = String()
}
