//
//  WeeksTableViewCell.swift
//  Login
//
//  Created by admin on 8/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
protocol WeeksTableViewCellDelegate: class {
    func touchHeader(_ header: WeeksTableViewCell, _ section: Int)
}
class WeeksTableViewCell: UITableViewHeaderFooterView {
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var isExpandImage: UIImageView!
    @IBOutlet weak var numberDayLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    weak var delegate: WeeksTableViewCellDelegate?
    var section: Int = 0
    @objc func tapHeader(_ gesture: UITapGestureRecognizer) {
        guard  let header = gesture.view as? WeeksTableViewCell else {
            return
        }
        delegate?.touchHeader(header, header.section)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHeader(_:))))
    }
    func isExpand(_ isExpand: Bool) {
        backgroundColorView.backgroundColor = isExpand ?
            UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) :
                                        UIColor.white
        weekLabel.textColor = isExpand ? UIColor.white : UIColor.black
        numberDayLabel.textColor = isExpand ? UIColor.white : UIColor.black
        isExpandImage.image = isExpand ? #imageLiteral(resourceName: "top") : #imageLiteral(resourceName: "down")
    }
}
