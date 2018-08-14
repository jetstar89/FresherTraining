//
//  TimeKeepingHeaderView.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/13/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

protocol ExpandTableViewHeaderDelegate: class {
    func toggleSection(header: TimeKeepingHeaderView, section: Int)
}

class TimeKeepingHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var weekLabel: UILabel!
    
    weak var delegate: ExpandTableViewHeaderDelegate?
    var section: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TimeKeepingHeaderView.tapHeader(gestureRecognizer:))))
    }
    
    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let header = gestureRecognizer.view as? TimeKeepingHeaderView else {
            return
        }
        print("tap header \(header.section)")
        delegate?.toggleSection(header: self, section: header.section)
    }
}
