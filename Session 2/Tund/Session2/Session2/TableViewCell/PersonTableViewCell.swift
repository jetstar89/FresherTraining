//
//  PersonTableViewCell.swift
//  HanhChinhNhanSu
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBAction func actionButton(_ sender: Any) {
        print("button Actiomn")
    }
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
