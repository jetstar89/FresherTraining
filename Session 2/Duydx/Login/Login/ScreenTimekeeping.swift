//
//  ScreenTimekeeping.swift
//  Login
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ScreenTimekeeping: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
//        setTime()
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
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(image: UIImage(named: "left"), style: .plain, target: self, action: #selector(onBack))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }
}
