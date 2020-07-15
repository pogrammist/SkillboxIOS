//
//  SecondViewController.swift
//  ios10.7.Tables
//
//  Created by user on 12.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    fileprivate let tableView: UITableView = {
        let tv = UITableView()
        tv.register(SettingCell.self, forCellReuseIdentifier: "Setting")
        return tv
    }()
    var safeArea: UILayoutGuide!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        createTableView()
    }
    
    func createTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Setting.allSettings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Setting.allSettings[section].settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Setting", for: indexPath) as! SettingCell
        cell.data = Setting.allSettings[indexPath.section].settings[indexPath.row]
        cell.accessoryType = Setting.allSettings[indexPath.section].settings[indexPath.row].accessoryType ?? UITableViewCell.AccessoryType.none
        cell.detailTextLabel?.text = Setting.allSettings[indexPath.section].settings[indexPath.row].status
        return cell
    }
    
    
}
