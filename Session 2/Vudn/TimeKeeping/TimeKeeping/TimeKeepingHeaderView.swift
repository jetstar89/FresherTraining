//
//  TimeKeepingHeaderView.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/13/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

protocol ExpandTableViewHeaderDelegate {
    func toggleSection(header: TimeKeepingHeaderView, section: Int)
}

class TimeKeepingHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var weekLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TimeKeepingHeaderView.tapHeader(gestureRecognizer:))))
    }
    
//    func setIsOnExpand(_ isOnExpand: Bool) {
//        self.contentView.backgroundColor = isOnExpand ? UIColor.frenchBlue : UIColor.white
//        weekLabel.textColor = isOnExpand ? UIColor.white : UIColor.black
//    }
    
    var delegate: ExpandTableViewHeaderDelegate?
    var section: Int = 0
    
    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let header = gestureRecognizer.view as? TimeKeepingHeaderView else {
            return
        }
        print("tap header \(header.section)")
        delegate?.toggleSection(header: self, section: header.section)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
