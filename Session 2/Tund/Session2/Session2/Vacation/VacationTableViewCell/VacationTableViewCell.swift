//
//  VacationTableViewCell.swift
//  Session2
//
//  Created by admin on 8/14/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class VacationTableViewCell: UITableViewCell {

    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var resultNoteLabel: UILabel!
    @IBOutlet weak var timeBeginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeDurationLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initView(name: String, reason: String, timeDuration: String,
                  timeBegin: String, resultNote: String, result: String) {
        self.resultNoteLabel.lineBreakMode = .byWordWrapping
        self.resultNoteLabel.numberOfLines = 0
        self.nameLabel.text = name
        self.reasonLabel.text = reason
        self.timeDurationLabel.text = timeDuration
        self.timeBeginLabel.text = timeBegin
        self.resultNoteLabel.text = resultNote
        if !resultNote.isEqual("") {
           self.resultNoteLabel.text = resultNote
        } else {
            self.resultNoteLabel.isHidden = true
        }
        if result.isEqual("Đang chờ duyệt") {
            self.imageResult.image = #imageLiteral(resourceName: "icPhepPendingRequest")
        } else if result.isEqual("Phép không lương") {
            self.imageResult.image = #imageLiteral(resourceName: "icPhepKoLuong")
        } else if result.isEqual("Không đồng ý") {
            self.imageResult.image = #imageLiteral(resourceName: "icRejectRequest")
        } else {
            self.imageResult.image = #imageLiteral(resourceName: "icPhepCoLuong")
        }
    }
}
