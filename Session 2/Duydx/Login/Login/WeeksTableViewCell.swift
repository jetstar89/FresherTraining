//
//  WeeksTableViewCell.swift
//  Login
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class WeeksTableViewCell: UITableViewCell {

    @IBOutlet weak var numberDayLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
