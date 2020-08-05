//
//  Setting.swift
//  ios10.7.Tables
//
//  Created by user on 12.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

struct Setting {
    var status: String?
    var swtch: Bool = false
    let title: String
    let image: UIImage?
    let accessoryType: UITableViewCell.AccessoryType?
}

struct SettingCategory {
    var number: Int
    var settings: [Setting]
}

extension Setting {
    static var allSettings: [SettingCategory] {
        return [
            SettingCategory(number: 1, settings: [
                Setting(swtch: true, title: "Авиарежим", image: UIImage(named: "airplane"), accessoryType: nil),
                Setting(status: "Yota", title: "Wi-Fi", image: UIImage(named: "wifi"), accessoryType: .disclosureIndicator),
                Setting(status: "Вкл", title: "Bluetooth", image: UIImage(named: "cloud"), accessoryType: .disclosureIndicator),
                Setting(title: "Сотовая связь", image: UIImage(named: "antenna.radiowaves.left.and.right"), accessoryType: .disclosureIndicator),
                Setting(title: "Режим модема", image: UIImage(named: "tray.and.arrow.down"), accessoryType: .disclosureIndicator)
            ]),
            
            SettingCategory(number: 2, settings: [
                Setting(title: "Уведомления", image: UIImage(named: "note"), accessoryType: .disclosureIndicator),
                Setting(title: "Звуки, тактильные сигналы", image: UIImage(named: "speaker.wave.3"), accessoryType: .disclosureIndicator),
                Setting(title: "Не беспокоить", image: UIImage(named: "moon"), accessoryType: .disclosureIndicator),
                Setting(title: "Экранное время", image: UIImage(named: "hourglass"), accessoryType: .disclosureIndicator)
            ]),
            
            SettingCategory(number: 3, settings: [
                Setting(title: "Основные", image: UIImage(named: "gear"), accessoryType: .detailDisclosureButton),
                Setting(title: "Пунки управления", image: UIImage(named: "switch.2"), accessoryType: .disclosureIndicator),
                Setting(title: "Экран и яркость", image: UIImage(named: "sun.max.fill"), accessoryType: .disclosureIndicator)
            ])
        ]
    }
}
