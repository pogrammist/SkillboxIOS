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
    
    var weather: WeatherMain? {
        return realm.objects(WeatherMain.self).first
    }
    
    var weathers: [WeatherDetail] {
        var weathers: [WeatherDetail] = []
        for weather in realm.objects(WeatherDetail.self) {
            weathers.append(weather)
        }
        return weathers
    }
    
    func addWeather(weather: WeatherMain) {
        try! realm.write {
            realm.deleteAll()
            realm.add(weather)
        }
    }
    
    func addWeatherDetail(weathers: [WeatherDetail]) {
        try! realm.write {
            weathers.map {
                realm.add( $0 )
            }
        }
    }
}
