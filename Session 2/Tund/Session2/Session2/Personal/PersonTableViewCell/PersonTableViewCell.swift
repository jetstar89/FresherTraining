//
//  PersonTableViewCell.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let separatorHeight = CGFloat(1)
        let screenSize = UIScreen.main.bounds
        let separator = UIView(frame: CGRect(x: 0, y: frame.height - separatorHeight, width: screenSize.width, height: separatorHeight))
        separator.backgroundColor = UIColor.steelGrey
        self.addSubview(separator)
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
