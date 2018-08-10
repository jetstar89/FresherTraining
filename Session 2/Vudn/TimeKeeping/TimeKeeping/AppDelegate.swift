//
//  AppDelegate.swift
//  DemoUIComponents
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        setUpRootViewIsLoginViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func setUpRootViewIsLoginViewController() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        let rootNavigationViewController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = rootNavigationViewController
    }
    
    func setUpRootViewIsHomeTabbar() {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        let homeViewNavigationController = UINavigationController(rootViewController: homeViewController)
        let profileViewNavigationController = UINavigationController(rootViewController: profileViewController)
        let tabbarController = UITabBarController()
        //tabbarController.viewControllers = [homeViewNavigationController, profileViewNavigationController]
        tabbarController.setViewControllers([homeViewNavigationController, profileViewNavigationController], animated: true)
        
        let homeTabbarItem = tabbarController.tabBar.items?[0]
        homeTabbarItem?.image = #imageLiteral(resourceName: "home").withRenderingMode(.automatic)
        homeTabbarItem?.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let profileTabbarItem = tabbarController.tabBar.items?[1]
        profileTabbarItem?.image = #imageLiteral(resourceName: "user").withRenderingMode(.automatic)
        profileTabbarItem?.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        window?.rootViewController = tabbarController
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
