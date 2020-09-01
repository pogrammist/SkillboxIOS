//
//  WeatherRealmPersistent.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 24.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import RealmSwift

class WeatherRealmPersistent {
    static var storage = WeatherRealmPersistent()
    
    private let realm = try! Realm()
    
    var weather: Weather? {
        return realm.objects(Weather.self).first
    }
    
    func updateWeather(weather: Weather, humidity: Int, pressure: Int, temp: Double) {
        try! realm.write {
            if realm.objects(Weather.self).isEmpty {
                realm.add(weather)
            } else {
                weather.humidity = humidity
                weather.pressure = pressure
                weather.temp = temp
            }
        }
    }
    
    var weathers: [WeatherDetail] {
        var weathers: [WeatherDetail] = []
        for weather in realm.objects(WeatherDetail.self) {
            weathers.append(weather)
        }
        return weathers
    }
    
    func addWeatherDetail(weathers: [WeatherDetail]) {
        try! realm.write {
            realm.add(weathers, update: .all)
        }
        print(realm.objects(WeatherDetail.self).count)
    }
}
