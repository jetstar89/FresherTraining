//
//  MainNavigationController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/15/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit


class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        // Do something
        //viewControllers = [homeViewController, profileVieController]
        //setViewControllers([homeViewController, profileVieController], animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let timeKeepingViewController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
        setViewControllers([timeKeepingViewController, homeViewController], animated: true)
        timeKeepingViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"), style: .plain, target: timeKeepingViewController, action: #selector(onShowLeftMenu(_:)))
        homeViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"), style: .plain, target: self, action: #selector(onShowLeftMenu(_:)))
    }
    
    @objc func onShowLeftMenu(_ sender: MainNavigationController) {
        
        //let profileVieController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        pushViewController(viewControllers[1], animated: true)
    }
}
