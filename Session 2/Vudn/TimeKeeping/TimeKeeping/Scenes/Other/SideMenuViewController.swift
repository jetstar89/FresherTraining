//
//  SideMenuViewController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/16/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuViewController: UISideMenuNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let leftMenuViewController = LeftMenuViewController(nibName: "LeftMenuViewController", bundle: nil)
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: leftMenuViewController)
        let menuRightNavigationController = UISideMenuNavigationController(rootViewController: homeViewController)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
        SideMenuManager.default.menuPushStyle = .preserve
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        let uiScreen = UIScreen.main.bounds
        SideMenuManager.default.menuWidth = max(round(min((uiScreen.width), (uiScreen.height)) * 0.8), 310)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
