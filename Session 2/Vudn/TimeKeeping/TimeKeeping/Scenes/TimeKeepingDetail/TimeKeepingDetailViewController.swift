//
//  HomeController.swift
//  DemoUIComponents
//
//  Created by Đinh Ngọc Vũ on 8/6/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class TimeKeepingDetailViewController: UIViewController {
    let tag = "TimeKeepingDetailViewController"
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tag + " did load")
        setUpNavigationBar(title: "Chi tiết chấm công",
                           leftBarButton: UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"),
                                                          style: .done,
                                                          target: self,
                                                          action: #selector(
                                                            onShowLeftMenu(_:))),
                           rightBarButton: nil)
        
//        let userDefault = UserDefaults.standard
//        userDefault.set("VU", forKey: "username")
//        userDefault.synchronize()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let userDefault = UserDefaults.standard
//        userDefault.value(forKey: "username")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(tag + " did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(tag + " did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print(tag + " deinit")
    }
    
    @IBAction func onChangerTabIndex(_ sender: UIButton) {
        
    }
}
