//
//  UITableViewExtension.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/21/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

extension UITableView {
    func setEmpty(message: String) {
        let label = UILabel()
        label.text = message
        label.textAlignment = .center
        self.backgroundView = label
    }
}
