//
//  AppDelegate.swift
//  Login
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        setupTabbarController()
        window = UIWindow(frame: UIScreen.main.bounds)
        setupNavigationViewController()
        window?.makeKeyAndVisible()
        return true
    }
    func setupNavigationViewController() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        let rootNavigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = rootNavigationController
    }
    func setupTabbarController() {
        let homeController = HomeController(nibName: "HomeController", bundle: nil)
        let profileController = ProfileController(nibName: "ProfileController", bundle: nil)
        let navigationHomeController = UINavigationController(rootViewController: homeController)
        let navigaitonProfileController = UINavigationController(rootViewController: profileController)
        navigaitonProfileController.navigationBar.isTranslucent = false
        let rootTabbarController = UITabBarController()
        rootTabbarController.viewControllers = [navigationHomeController,navigaitonProfileController]
        window?.rootViewController = rootTabbarController
        rootTabbarController.tabBar.items?[0].image = #imageLiteral(resourceName: "house")
        rootTabbarController.tabBar.items?[1].image = #imageLiteral(resourceName: "user")
        rootTabbarController.tabBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
        rootTabbarController.tabBar.tintColor = UIColor.white
        rootTabbarController.selectedIndex = 0
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

