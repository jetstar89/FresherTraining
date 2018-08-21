//
//  UIViewControllerExtension.swift
//  Login
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func alertWith(_ title: String?, _ message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Đồng ý", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
