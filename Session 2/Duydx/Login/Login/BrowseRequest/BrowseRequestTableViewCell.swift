//
//  BrowseRequestTableViewCell.swift
//  Login
//
//  Created by admin on 8/14/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class BrowseRequestTableViewCell: UITableViewCell {

    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var timeRequestLabel: UILabel!
    @IBOutlet weak var namePersonLabel: UILabel!
    @IBOutlet weak var timeVacationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
