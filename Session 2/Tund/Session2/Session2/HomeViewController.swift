//
//  HomeViewController.swift
//  Session2
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initView() {
        //set up navigationBar
        navigationItem.title = "Home"
        var navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
        // set up tabbar
        tabBarController?.tabBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
        var tabbarAppearace = UITabBar.appearance()
        tabbarAppearace.tintColor = UIColor.white
        
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
