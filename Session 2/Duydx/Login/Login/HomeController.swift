//
//  HomeController.swift
//  Login
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: IBAction
    @IBAction func onConfirm(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    //MARK: initView
    func initView() {
        navigationItem.title = "Home"
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}
