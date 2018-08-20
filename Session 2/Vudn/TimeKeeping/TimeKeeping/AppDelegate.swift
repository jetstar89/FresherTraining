//
//  AppDelegate.swift
//  DemoUIComponents
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import SideMenu
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        Realm.Configuration.defaultConfiguration.migrationBlock = ({(_ migration: Migration, _ oldSchemaVersion: UInt64) in
//
//        })
        setupDefaultAppearance()
        window = UIWindow(frame: UIScreen.main.bounds)
        setUpRootViewIsLoginViewController()
        setUpLeftMenu()
        window?.makeKeyAndVisible()
        return true
    }
    
    func setupDefaultAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor.frenchBlue
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    func setUpRootViewIsLoginViewController() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        let rootNavigationViewController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = rootNavigationViewController
    }
    
    func setUpRootViewIsTimeKeepingViewController() {
        let viewcontroller = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
        let nav = UINavigationController(rootViewController: viewcontroller)
//        let rootSideMenuViewController = SideMenuViewController(rootViewController: timeKeepingViewController)
        window?.rootViewController = nav
    }
    
    func setUpRootViewIsHomeTabbar() {
        let tabbarController = MainTabbarController()
        window?.rootViewController = tabbarController
    }
    
    func setUpLeftMenu() {
        let leftMenuView = LeftMenuViewController(nibName: "LeftMenuViewController", bundle: nil)
        let leftMenuNavigation = UISideMenuNavigationController(rootViewController: leftMenuView)
        SideMenuManager.default.menuLeftNavigationController = leftMenuNavigation
        SideMenuManager.default.menuPushStyle = .preserve
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        let uiScreen = UIScreen.main.bounds
        SideMenuManager.default.menuWidth = max(round(min((uiScreen.width), (uiScreen.height)) * 0.8), 310)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate {
    
}
