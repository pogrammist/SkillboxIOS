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

class WeatherDetail: Object {
    @objc var dtTxt = String()
    @objc var humidity = Int()
    @objc var pressure = Int()
    @objc var temp = Double()
    @objc var speed = Double()
    @objc var main = String()
}
