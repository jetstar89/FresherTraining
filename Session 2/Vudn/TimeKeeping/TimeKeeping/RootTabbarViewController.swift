//
//  RootTabbarViewController.swift
//  TimeKeeping
//
//  Created by Huy Nguyen on 8/14/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class RootTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let viewcontroller = UIViewController(nibName: "", bundle: nil)
        
        self.viewControllers = [viewcontroller]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
