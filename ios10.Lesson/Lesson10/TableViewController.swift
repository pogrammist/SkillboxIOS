//
//  TableViewController.swift
//  Lesson10
//
//  Created by Nikita Arkhipov on 17.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

struct Meetup{
    var date = ""
    var names: [String] = []
}

class MeetupFabric{
    static func meetups() -> [Meetup]{
        return [
            Meetup(date: "Сегодня", names: ["Nikita", "Anton", "Andrey"]),
            Meetup(date: "Вчера", names: ["Nikita", "Andrey"]),
            Meetup(date: "10.07.18", names: ["Nikita", "Anton"])
        ]
    }
}

class TableViewController: UIViewController {
    
//    var names = ["Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey"]
    
    var meetups = MeetupFabric.meetups()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,
            let index = tableView.indexPath(for: cell){
//            print(names[index.row])
        }
    }

}

extension TableViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return meetups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetups[section].names.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return meetups[section].date
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as! TableViewCell
        let meetup = meetups[section]
        cell.nameLabel.text = meetup.date
        cell.indexLabel.text = "\(meetup.names.count)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let name = meetups[indexPath.section].names[indexPath.row]
        cell.nameLabel.text = name
        cell.indexLabel.text = "\(indexPath.section): \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(names[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
