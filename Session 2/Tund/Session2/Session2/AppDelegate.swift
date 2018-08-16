//
//  AppDelegate.swift
//  Session2
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
        window = UIWindow(frame: UIScreen.main.bounds)
        setupDeaultStyleNavigationBar()
        setupNavigation()
        window?.makeKeyAndVisible()
        return true
    }
    func setupDeaultStyleNavigationBar() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBarAppearace.barTintColor = UIColor.frenchBlue
    }
    func setupNavigation() {
        let viewcontroller = UIStoryboard(name: "Main",
                                        bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        let rootNavigationController = UINavigationController(rootViewController: viewcontroller)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
    func setUpNavigationTimeKeeping() {
        let viewcontroller = UIStoryboard(
            name: "TimeKeepingViewController", bundle: nil)
            .instantiateViewController(withIdentifier: "TimeKeepingViewController")
        let rootNavigationController = UINavigationController(rootViewController: viewcontroller)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
//    func setupTabbar() {
//        let rootSideMenu = RootSideMenuViewController(nibName: "RootSideMenuViewController", bundle: nil)
//        let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
//        let navigationRootSideMenu = UINavigationController(rootViewController: rootSideMenu)
//        let navigationHome = UINavigationController(rootViewController: homeController)
//        let tabbarController = UITabBarController()
//        tabbarController.viewControllers = [navigationHome, navigationRootSideMenu]
//        let homeTabbarItem = tabbarController.tabBar.items?[0]
//        homeTabbarItem?.image = #imageLiteral(resourceName: "home-1").withRenderingMode(.alwaysOriginal)
//        homeTabbarItem?.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
//        let profileTabbarItem = tabbarController.tabBar.items?[1]
//        profileTabbarItem?.image = #imageLiteral(resourceName: "man-user").withRenderingMode(.alwaysOriginal)
//        profileTabbarItem?.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
//        tabbarController.tabBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
//        window?.rootViewController = tabbarController
//        window?.makeKeyAndVisible()
//    }
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
