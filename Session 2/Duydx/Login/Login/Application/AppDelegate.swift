//
//  AppDelegate.swift
//  Login
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        setupTabbarController()
        setUpLeftMenu()
        window = UIWindow(frame: UIScreen.main.bounds)
        setupNavigationViewController()
        window?.makeKeyAndVisible()
        return true
    }
    func setupNavigationViewController() {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ViewController")
        let rootNavigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = rootNavigationController
    }
    func rootTimeKeepingViewController() {
        let timeKeepingViewController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
        let rootNavigationController = UINavigationController(rootViewController: timeKeepingViewController)
        window?.rootViewController = rootNavigationController
    }
//    func setupTabbarController() {
//        let homeController = HomeController(nibName: "HomeController", bundle: nil)
//        let profileController = ProfileController(nibName: "ProfileController", bundle: nil)
//        let navigationHomeController = UINavigationController(rootViewController: homeController)
//        let navigaitonProfileController = UINavigationController(rootViewController: profileController)
//        navigaitonProfileController.navigationBar.isTranslucent = false
//        let rootTabbarController = UITabBarController()
//        rootTabbarController.viewControllers = [navigationHomeController,navigaitonProfileController]
//        window?.rootViewController = rootTabbarController
//        rootTabbarController.tabBar.items?[0].image = #imageLiteral(resourceName: "house")
//        rootTabbarController.tabBar.items?[1].image = #imageLiteral(resourceName: "user")
//        rootTabbarController.tabBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
//        rootTabbarController.tabBar.tintColor = UIColor.white
//        rootTabbarController.selectedIndex = 0
//    }
    func setUpLeftMenu() {
        let leftMenuView = ProfileController.init(nibName: "ProfileController", bundle: nil)
        let menuNavigation = UISideMenuNavigationController(rootViewController: leftMenuView)
        SideMenuManager.default.menuLeftNavigationController = menuNavigation
        SideMenuManager.default.menuPushStyle = .preserve
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        let uiScreen = UIScreen.main.bounds
        SideMenuManager.default.menuWidth = max(round(min(uiScreen.width, uiScreen.height)*0.6), 310)
    }
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
extension UITableViewCell {
    func isExpand(_ isExpand: Bool) {
//        self.backgroundColor = isExpand ? UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) :
//                                        UIColor.white
//        guard let view: WeeksTableViewCell = self as? WeeksTableViewCell else {
//            return
//        }
//        view.weekLabel.textColor = isExpand ? UIColor.white : UIColor.black
//        view.numberDayLabel.textColor = isExpand ? UIColor.white : UIColor.black
//        view.isExpandImage.image = isExpand ? #imageLiteral(resourceName: "top") : #imageLiteral(resourceName: "down")
    }
}
