//
//  OutageTableViewCell.swift
//  Lekkie
//
//  Created by Elliot on 13/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import UIKit

class OutageTableViewCell: UITableViewCell {
    static let reuseIdentifier = "OutagesReuseID"
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var estRestoreLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
}
