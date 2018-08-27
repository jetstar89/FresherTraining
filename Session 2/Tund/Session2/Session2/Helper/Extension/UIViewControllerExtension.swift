//
//  UIViewControllerExtension.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/21/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import SideMenu

extension UIViewController {
    func setUpNavigationBar(title: String, leftBarButton: UIBarButtonItem?, rightBarButton: UIBarButtonItem?) {
        navigationItem.title = title.uppercased()
        if let leftBarButton = leftBarButton {
            navigationItem.leftBarButtonItem = leftBarButton
        }
        if let rightBarButton = rightBarButton {
            navigationItem.rightBarButtonItem = rightBarButton
        }
    }
    
    @objc func onShowLeftMenu(_ sender: UIBarButtonItem) {
        // show left menu
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else { return }
        present(sideMenu, animated: true, completion: nil)
    }
    
    @objc func onHiddenLeftMenu(_ sender: UIBarButtonItem) {
        // Do something when hidden left menu
    }
    
    func alertWith(_ title: String?, _ message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
