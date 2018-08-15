//
//  MySideMenuViewController.swift
//  Session2
//
//  Created by admin on 8/15/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu

class MySideMenuViewController: UISideMenuNavigationController {

    override func awakeFromNib() {
        super.awakeFromNib()
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        let screenSize: CGRect = UIScreen.main.bounds
        SideMenuManager.default.menuWidth = max(round(min((screenSize.width), (screenSize.height)) * 0.75), 311)
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
