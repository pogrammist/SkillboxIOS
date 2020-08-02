//
//  SettingCell.swift
//  ios10.7.Tables
//
//  Created by user on 12.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit


class SettingCell02: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingDetailLabel: UILabel!
    
    var data: Setting? {
        didSet {
            guard let data = data else { return }
            iconImageView.image = data.image
            settingLabel.text = data.title
            settingDetailLabel.text = data.status
        }
    }
}
