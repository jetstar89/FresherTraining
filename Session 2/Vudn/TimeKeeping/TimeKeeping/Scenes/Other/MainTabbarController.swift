//
//  MainTabbarViewController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/15/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {
    override func viewDidLoad() {
        // do something
        let timeKeepingDetailViewController = TimeKeepingDetailViewController(nibName: "HomeViewController", bundle: nil)
        let profileViewController = LeftMenuViewController(nibName: "ProfileViewController", bundle: nil)
        let homeViewNavigationController = UINavigationController(rootViewController: timeKeepingDetailViewController)
        let profileViewNavigationController = UINavigationController(rootViewController: profileViewController)
        
        //tabbarController.viewControllers = [homeViewNavigationController, profileViewNavigationController]
        self.setViewControllers([homeViewNavigationController, profileViewNavigationController], animated: true)
        
        let homeTabbarItem = tabBar.items?[0]
        homeTabbarItem?.image = #imageLiteral(resourceName: "ic_home").withRenderingMode(.automatic)
        homeTabbarItem?.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let profileTabbarItem = tabBar.items?[1]
        profileTabbarItem?.image = #imageLiteral(resourceName: "ic_user").withRenderingMode(.automatic)
        profileTabbarItem?.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
}
