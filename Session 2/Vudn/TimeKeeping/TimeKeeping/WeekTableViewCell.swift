//TimeKeepingTableViewHeaderViewController
//  WeekTableViewCell.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/10/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class WeekTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var countDayLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var expandImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
