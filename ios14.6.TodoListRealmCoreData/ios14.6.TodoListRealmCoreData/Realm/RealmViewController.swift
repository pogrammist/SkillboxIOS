//
//  RealmViewController.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 18.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class RealmViewController: UIViewController {

    @IBOutlet weak var realmTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realmTableView.dataSource = self
        
    }
    
    @IBAction func addTask(_ sender: Any) {
        let newTask = RealmEntity()
        newTask.title = RealmPersistence.storage.tasks.count + 1
        RealmPersistence.storage.addTask(task: newTask)
        realmTableView.reloadData()
    }
}

extension RealmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RealmPersistence.storage.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = realmTableView.dequeueReusableCell(withIdentifier: "RealmCell", for: indexPath) as! RealmTableViewCell
        cell.task = RealmPersistence.storage.tasks[indexPath.row]
        return cell
    }
}

