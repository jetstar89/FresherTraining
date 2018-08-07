//
//  HomeController.swift
//  Login
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setTime() {
        var time: String!
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let dayofmonth = calendar.component(.day, from: date)
        let dayofweek = calendar.component(.weekday, from: date)
        time = "Thứ " + String(dayofweek) + " - " + String(dayofmonth) + "/" + String(month) + "/" + String(year)
        navigationItem.title = time
    }
    func initView() {
        navigationItem.title = "Home"
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }

}
