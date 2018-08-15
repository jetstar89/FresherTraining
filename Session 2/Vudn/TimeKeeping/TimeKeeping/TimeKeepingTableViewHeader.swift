//
//  TimeKeepingHeaderView.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/13/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

protocol ExpandTableViewHeaderDelegate: class {
    func toggleSection(header: TimeKeepingTableViewHeader, section: Int)
}

class TimeKeepingTableViewHeader: UITableViewHeaderFooterView {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var countDayLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    weak var delegate: ExpandTableViewHeaderDelegate?
    var section: Int = 0
    
    // MARK: - Selector
    
    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let header = gestureRecognizer.view as? TimeKeepingTableViewHeader else {
            return
        }
        print("tap header \(header.section)")
        delegate?.toggleSection(header: self, section: header.section)
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TimeKeepingTableViewHeader.tapHeader(gestureRecognizer:))))
    }
    
    // MARK: - Func
    
    func setIsOnExpand(_ isOnExpand: Bool) {
        backgroundColorView.backgroundColor = isOnExpand ? UIColor.frenchBlue : UIColor.white
        weekLabel.textColor = isOnExpand ? UIColor.white : UIColor.black
        countDayLabel.textColor = isOnExpand ? UIColor.white : UIColor.black
        dayLabel.textColor = isOnExpand ? UIColor.white : UIColor.steelGrey
        arrowImageView.image = isOnExpand ? #imageLiteral(resourceName: "ic_unexpand_arrow") : #imageLiteral(resourceName: "ic_expand_arrow")
    }

}
