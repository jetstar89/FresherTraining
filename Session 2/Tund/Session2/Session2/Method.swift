//
//  Method.swift
//  Session2
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class Method: NSObject {
    var functionLabel: String
    var functionImageView: UIImage
    init(_ image: UIImage, _ label: String) {
        self.functionImageView = image
        self.functionLabel = label
    }

}
