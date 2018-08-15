//
//  HeaderViewController.swift
//  Session2
//
//  Created by admin on 8/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {
    var listTimeKeeping: [TimeKeeping] = []

    @IBOutlet weak var headerTimeKeepingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let timeKeeping = TimeKeeping(isExpand: false, week: "Tuần 3",
                                      day: "5/5",
                                      dayOfWeek: [DayOfWeek(weekday: "T2", day: "15",
                                                            checkIn: "08:00 SA",
                                                            checkOut: "05: 00 CH",
                                                            workday: "1",
                                                            status: "Đang làm việc")])
        listTimeKeeping.append(timeKeeping)
        listTimeKeeping.append(timeKeeping)
        listTimeKeeping.append(timeKeeping)
        listTimeKeeping.append(timeKeeping)        
        initNavigation()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initNavigation() {
        navigationItem.title = "CHẤM CÔNG HEADER"
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
    }
}
extension HeaderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
extension HeaderViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
         return listTimeKeeping.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idenfier = "cell"
        guard let cell: WeekHeaderTableViewCell = headerTimeKeepingTableView.dequeueReusableCell(
            withIdentifier: idenfier,
            for: indexPath) as? WeekHeaderTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
