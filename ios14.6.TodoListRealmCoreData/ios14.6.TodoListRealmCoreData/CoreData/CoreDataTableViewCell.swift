//
//  RealmTableViewCell.swift
//  ios14.6.TodoListRealmCoreData
//
//  Created by user on 19.08.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

protocol CoreDataTableViewCellDelegate {
    func setComplite(task: CoreDataEntity)
    func setNote(task: CoreDataEntity, note: String)
}

class CoreDataTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var noteTextField: UITextField!
    
    var delegate: CoreDataTableViewCellDelegate?
    var task: CoreDataEntity? {
        didSet {
            guard let task = task else { return }
            titleLabel.text = "Task \(task.title)"
            dateLabel.text = task.date?.formattedISO8601
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
        backgroundColor = .systemYellow
    }
}
