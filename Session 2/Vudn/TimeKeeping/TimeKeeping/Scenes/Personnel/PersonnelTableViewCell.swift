//
//  PersonnelTableViewCell.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/16/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class PersonnelTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var employeeTypeLabel: UILabel!
    @IBOutlet weak var statusLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusLabel.layer.cornerRadius = 2
        let separatorHeight = CGFloat(2)
        let screenSize = UIScreen.main.bounds
        let separator = UIView(frame: CGRect(x: 0, y: frame.height - separatorHeight, width: screenSize.width, height: separatorHeight))
        separator.backgroundColor = UIColor.paleGrey
        self.addSubview(separator)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
