//
//  RootSideMenuViewController.swift
//  Session2
//
//  Created by admin on 8/15/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu

class RootSideMenuViewController: UIViewController {
    let screenSize: CGRect = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu"), style: .plain, target: self, action: #selector(openMenu))
        // setupSide menu
        let menuleftRoot = Profile3ViewController(nibName: "Profile3ViewController", bundle: nil)
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: menuleftRoot)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        
        SideMenuManager.default.menuWidth = max(round(min((screenSize.width), (screenSize.height)) * 0.8), 311)

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func openMenu() {
        
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else { return  }
      
        self.present(sideMenu, animated: true, completion: nil)
    }
    

   

}
