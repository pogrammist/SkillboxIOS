//
//  ViewController.swift
//  ios10.7.TablesOnStoryboard
//
//  Created by user on 16.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.allSettings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.allSettings[section].settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if Setting.allSettings[indexPath.section].settings[indexPath.row].swtch {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell01", for: indexPath) as! SettingCell01
//            cell.iconImageView.image = Setting.allSettings[indexPath.section].settings[indexPath.row].image
//            cell.settingLabel.text = Setting.allSettings[indexPath.section].settings[indexPath.row].title
            cell.data = Setting.allSettings[indexPath.section].settings[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell02", for: indexPath) as! SettingCell02
//            cell.iconImageView.image = Setting.allSettings[indexPath.section].settings[indexPath.row].image
//            cell.settingLabel.text = Setting.allSettings[indexPath.section].settings[indexPath.row].title
//            cell.settingDetailLabel.text = Setting.allSettings[indexPath.section].settings[indexPath.row].status
            cell.data = Setting.allSettings[indexPath.section].settings[indexPath.row]
            return cell
        }
    }
}
