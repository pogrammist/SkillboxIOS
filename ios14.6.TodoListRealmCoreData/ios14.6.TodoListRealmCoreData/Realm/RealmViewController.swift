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
        realmTableView.keyboardDismissMode = .onDrag
        
    }
    
    @IBAction func addTask(_ sender: Any) {
        let newTask = RealmEntity()
        newTask.title = (RealmPersistence.storage.tasks.last?.title ?? 0) + 1
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
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let toDrop = RealmPersistence.storage.tasks[indexPath.row]
            RealmPersistence.storage.dropTask(task: toDrop)
            realmTableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

extension RealmViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !realmTableView.isDecelerating {
            view.endEditing(true)
        }
    }
}

extension RealmViewController: RealmTableViewCellDelegate {
    func setComplite(task: RealmEntity) {
        RealmPersistence.storage.compiteTask(task: task)
        realmTableView.reloadData()
    }
    
    func setNote(task: RealmEntity, note: String) {
        RealmPersistence.storage.noteTask(task: task, note: note)
        realmTableView.reloadData()
    }
}
