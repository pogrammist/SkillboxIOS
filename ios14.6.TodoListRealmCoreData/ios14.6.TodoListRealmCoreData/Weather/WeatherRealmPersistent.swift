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
    
//    var weathers: [WeatherDetail]? {
//        return realm.objects(WeatherDetail.self).map{ $0 }
//    }
    
    func addWeather(weather: Weather) {
        try! realm.write {
            realm.deleteAll()
            realm.add(weather)
        }
    }
    
//    func addWeatherDetail(weathers: [WeatherDetail]) {
//        try! realm.write {
//            weathers.map {
//                realm.deleteAll()
//                realm.add( $0 )
//            }
//        }
//    }
}
