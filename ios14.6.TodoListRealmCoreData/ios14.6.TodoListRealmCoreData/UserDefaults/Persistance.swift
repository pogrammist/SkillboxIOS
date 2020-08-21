//
//  Persistence.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 18.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class Persistance {
    static let shared = Persistance()
    private let kUserNameKey = "Persistence.kUserNameKey"
    private let kUserFamilyNameKey = "Persistence.kUserFamilyNameKey"
    
    var userName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserNameKey) }
        get { return UserDefaults.standard.string(forKey: kUserNameKey) }
    }
    
    var userFamilyName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserFamilyNameKey) }
        get { return UserDefaults.standard.string(forKey: kUserFamilyNameKey) }
    }
}
