//
//  UITableViewExtension.swift
//  Session2
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func setEmpty(message: String) {
        let label = UILabel()
        label.text = message
        label.textAlignment = .center
        self.backgroundView = label
    }
}
