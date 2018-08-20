//
//  NavigationRule.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/17/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import SideMenu

class NavigationRule: UIViewController {
    func setUpNavigation(_ sender: UIViewController) {
        sender.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"), style: .done, target: sender, action: #selector(onShowLeftMenu(_:)))
    }
    
    @objc func onShowLeftMenu(_ sender: UIViewController) {
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else { return }
        sender.present(sideMenu, animated: true, completion: nil)
    }
}
