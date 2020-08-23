//
//  RealmViewController.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 18.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {
    
    @IBOutlet weak var coreDataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreDataTableView.dataSource = self
        coreDataTableView.keyboardDismissMode = .onDrag
        
    }
    
    @IBAction func addTask(_ sender: Any) {
        CoreDataPersistent.storage.addTask()
        coreDataTableView.reloadData()
    }
}

extension CoreDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CoreDataPersistent.storage.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coreDataTableView.dequeueReusableCell(withIdentifier: "CoreDataCell", for: indexPath) as! CoreDataTableViewCell
        cell.task = CoreDataPersistent.storage.tasks[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataPersistent.storage.dropTask(index: indexPath.row)
            coreDataTableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

extension CoreDataViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !coreDataTableView.isDecelerating {
            view.endEditing(true)
        }
    }
}

extension CoreDataViewController: CoreDataTableViewCellDelegate {
    func setComplite(task: CoreDataEntity) {
        CoreDataPersistent.storage.compiteTask(task: task)
        coreDataTableView.reloadData()
    }
    
    func setNote(task: CoreDataEntity, note: String) {
        CoreDataPersistent.storage.noteTask(task: task, note: note)
        coreDataTableView.reloadData()
    }
}
