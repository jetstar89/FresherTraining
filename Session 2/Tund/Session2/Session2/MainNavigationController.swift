//
//  MainNavigationController.swift
//  Session2
//
//  Created by admin on 8/17/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let timeKeepingViewController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
        setViewControllers([timeKeepingViewController,
                            homeViewController], animated: true)
        //timeKeepingController
        timeKeepingViewController.navigationItem.leftBarButtonItem =
            UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"), style: .plain,
                        target: timeKeepingViewController,
                        action: #selector(onShowLeftMenu(_:)))
        // homeviewController
        homeViewController.navigationItem.leftBarButtonItem =
            UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"), style: .plain,
                            target: self, action: #selector(onShowLeftMenu(_:)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func onShowLeftMenu(_ sender: MainNavigationController) {
        //let profileVieController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        pushViewController(viewControllers[1], animated: true)
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
