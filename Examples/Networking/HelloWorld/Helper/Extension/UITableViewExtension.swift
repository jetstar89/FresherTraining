//
//  UITableViewExtension.swift
//  HelloWorld
//
//  Created by hnc on 8/20/18.
//  Copyright © 2018 hnc. All rights reserved.
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
