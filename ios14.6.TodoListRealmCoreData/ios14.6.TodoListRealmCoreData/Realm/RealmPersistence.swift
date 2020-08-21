//
//  RealmPersistence.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 18.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import RealmSwift

class RealmPersistence {
    static var storage = RealmPersistence()
    
    private let realm = try! Realm()
    
    var tasks: [RealmEntity] {
        return realm.objects(RealmEntity.self).map{ $0 }
    }

    func addTask(task: RealmEntity) {
        try! realm.write {
            realm.add(task)
        }
    }
    
    func compiteTask(task: RealmEntity) {
        try! realm.write {
            task.isCompleted = !task.isCompleted
        }
    }
    
    func noteTask(task: RealmEntity, note: String) {
        try! realm.write {
            task.note = note
        }
    }    
}
