//
//  Weather.swift
//  
//
//  Created by user on 12.08.2020.
//

import Foundation
import RealmSwift

class WeatherMain: Object {
    @objc var humidity = Int()
    @objc var pressure = Int()
    @objc var temp = Double()
}

class Wind: Object {
    @objc var speed = Double()
}

class Weather: Object {
    @objc var main = String()
}

class WeatherDetail: Object {
    @objc var dtTxt = String()
    @objc var main: WeatherMain?
    @objc var wind: Wind?
    @objc var weather: Weather?
}
