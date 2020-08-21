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

//    func changeTask(task: RealmEntity, description descriptionInput: String? = nil, isComplited isComplitedInput: Bool? = nil) {
//        let description: String = descriptionInput ?? task.notes
//        let isComplited: Bool = isComplitedInput ?? task.isCompleted
//        
//        try! realm.write {
//            task.notes = description
//            task.isCompleted = isComplited
//        }
//    }

    
}
