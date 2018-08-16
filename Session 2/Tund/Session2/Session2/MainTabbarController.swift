//
//  MainTabbarController.swift
//  Session2
//
//  Created by admin on 8/15/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let profileController = Profile3ViewController(nibName: "Profile3ViewController", bundle: nil)
        let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let navigationProfile = UINavigationController(rootViewController: profileController)
        navigationProfile.navigationBar.isTranslucent = false
        let navigationHome = UINavigationController(rootViewController: homeController)
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [navigationHome, navigationProfile]
        let homeTabbarItem = tabbarController.tabBar.items?[0]
        homeTabbarItem?.image = #imageLiteral(resourceName: "home-1").withRenderingMode(.alwaysOriginal)
        homeTabbarItem?.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        let profileTabbarItem = tabbarController.tabBar.items?[1]
        profileTabbarItem?.image = #imageLiteral(resourceName: "man-user").withRenderingMode(.alwaysOriginal)
        profileTabbarItem?.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        tabbarController.tabBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
