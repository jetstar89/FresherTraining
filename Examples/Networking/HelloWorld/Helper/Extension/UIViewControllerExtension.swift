//
//  UIViewControllerExtension.swift
//  HelloWorld
//
//  Created by hnc on 8/20/18.
//  Copyright © 2018 hnc. All rights reserved.
//

import UIKit

extension UIViewController {
    func alertWith(_ title: String?, _ message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
