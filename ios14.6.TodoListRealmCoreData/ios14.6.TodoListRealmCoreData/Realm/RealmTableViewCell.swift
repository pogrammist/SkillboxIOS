//
//  RealmTableViewCell.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 19.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

protocol RealmTableViewCellDelegate {
    func setComplite(task: RealmEntity)
    func setNote(task: RealmEntity, note: String)
}

class RealmTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var noteTextField: UITextField!
    
    var delegate: RealmTableViewCellDelegate?
    var task: RealmEntity? {
        didSet {
            guard let task = task else { return }
            titleLabel.text = "Task \(task.title)"
            dateLabel.text = task.date.formattedISO8601
            noteTextField.text = task.note
            if task.isCompleted {
                hideTask()
            } else {
                unhideTask()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        doneButton.layer.cornerRadius = doneButton.frame.width / 2
    }
    
    @IBAction func setCompliteTask(_ sender: Any) {
        delegate?.setComplite(task: task!)
    }
    
    @IBAction func setNoteTask(_ sender: Any) {
        guard let note = noteTextField.text else { return }
        delegate?.setNote(task: task!, note: note)
    }
    
    func hideTask() {
        noteTextField.isEnabled = false
        doneButton.backgroundColor = .systemGray
        backgroundColor = .systemGray6
    }
    
    func unhideTask() {
        noteTextField.isEnabled = true
        doneButton.backgroundColor = .systemBlue
        backgroundColor = .systemOrange
    }
}

extension Date {
    static let formatterISO8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    var formattedISO8601: String {
        return Date.formatterISO8601.string(from: self)
    }
}
