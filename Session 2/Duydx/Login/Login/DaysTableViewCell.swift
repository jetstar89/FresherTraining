//
//  DaysTableViewCell.swift
//  Login
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class DaysTableViewCell: UITableViewCell {

    @IBAction func onRequest(_ sender: Any) {
        if let title = requestButton.titleLabel?.text {
            switch title {
            case "P":
                print("Nghỉ phép")
                break
            case "!":
                print("Đuổi việc")
                break
            default:
                break
            }
        }
    }
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var dayWarningLabel: UILabel!
    @IBOutlet weak var warningRequestLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timeDayLabel: UILabel!
    @IBOutlet weak var timeCheckOutLabel: UILabel!
    @IBOutlet weak var timeCheckInLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
