//
//  SettingCell.swift
//  ios10.7.Tables
//
//  Created by user on 12.07.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit


class SettingCell: UITableViewCell {
    
    var data: Setting? {
        didSet {
            guard let data = data else { return }
            img.image = data.image
            lbl.text = data.title
            if data.swtch {
                enableSwitch()
            }
        }
    }
    
    fileprivate let containerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    fileprivate let img: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    fileprivate let lbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let statusLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.textColor =  .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let swtch: UISwitch = {
        let swtch = UISwitch()
        swtch.translatesAutoresizingMaskIntoConstraints = false
        swtch.clipsToBounds = true
        swtch.tintColor = .red
        swtch.thumbTintColor = .green
        swtch.onTintColor = .blue
        return swtch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
        containerView.addSubview(img)
        img.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        img.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 22).isActive = true
        img.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        containerView.addSubview(lbl)
        lbl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        lbl.leadingAnchor.constraint(equalTo: img.trailingAnchor,  constant: 10).isActive = true
    }
    
    func enableSwitch() {
        containerView.addSubview(swtch)
        swtch.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        swtch.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
