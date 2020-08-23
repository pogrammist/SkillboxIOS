//
//  RealmPersistence.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 18.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import CoreData

class CoreDataPersistent {
    static var storage = CoreDataPersistent()
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private lazy var managedContext = self.appDelegate.persistentContainer.viewContext
    private lazy var entity = NSEntityDescription.entity(forEntityName: "CoreDataEntity", in: self.managedContext)!
    
    lazy var tasks: [CoreDataEntity] = try! self.managedContext.fetch(NSFetchRequest<CoreDataEntity>(entityName: "CoreDataEntity"))
    
    
    func addTask() {
        let task = CoreDataEntity(entity: entity, insertInto: managedContext)
        let taskNumber = (tasks.last?.title ?? 0) + 1
        task.setValue(taskNumber, forKeyPath: "title")
        task.setValue(Date(), forKey: "date")
        
        do {
            try managedContext.save()
            tasks.append(task)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func compiteTask(task: CoreDataEntity) {
        task.setValue(!task.isCompleted, forKeyPath: "isCompleted")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func noteTask(task: CoreDataEntity, note: String) {
        task.setValue(note, forKeyPath: "note")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func dropTask(index: Int) {
        let task = tasks.remove(at: index)
        do {
            try managedContext.save()
            managedContext.delete(task)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
