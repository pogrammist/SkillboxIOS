//
//  RealmPersistance.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 18.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import RealmSwift

class RealmEntity: Object {
    @objc dynamic var title = Int()
    @objc dynamic var date = NSDate()
    @objc dynamic var note = String()
    @objc dynamic var isCompleted = false
}
