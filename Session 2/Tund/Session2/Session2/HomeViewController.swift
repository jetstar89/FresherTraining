//
//  HomeViewController.swift
//  Session2
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: iniview
    func initView() {
        //set up navigationBar
        navigationItem.title = "Home"
        var navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
        
        // set up tabbar
    
        
    }
    

    

}
