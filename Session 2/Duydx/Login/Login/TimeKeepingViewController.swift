//
//  TimeKeepingViewController.swift
//  Login
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TimeKeepingViewController: UIViewController {
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var totalNumberDayLabel: UILabel!
    @IBOutlet weak var timeKeepingTableView: UITableView!
    var listTimeKeeping = [Week]()
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        register()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popViewController(animated: true)
    }
    func register() {
//        timeKeepingTableView.dataSource = self
//        timeKeepingTableView.delegate = self
//        timeKeepingTableView.register(UINib(nibName: "WeeksTableViewCell", bundle: nil), forCellReuseIdentifier: "week")
//        timeKeepingTableView.register(UINib(nibName: "DaysTableViewCell", bundle: nil), forCellReuseIdentifier: "day")
    }
    //MARK: initView
    func initView() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "TimeKeeping"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconMenu"), style: .plain, target: self, action: #selector(selectedMenu))
        listTimeKeeping = [Week(false, "Tuần 1", "5/5" ,[DayOfWeek.init("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                    DayOfWeek.init("T3", "11", "08:30 SA", "05:30 CH", "1", "Làm trong giờ"),
                                                    DayOfWeek.init("T4", "12", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                    DayOfWeek.init("T5", "13", "08:30 SA", "12:10 CH", "0.5", "Làm ngoài giờ"),
                                                    DayOfWeek.init("T6", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ")]),
                           Week(false, "Tuần 2", "4/5" ,[DayOfWeek.init("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                           DayOfWeek.init("T3", "11", "08:30 SA", "05:30 CH", "1", "Làm trong giờ"),
                                                           DayOfWeek.init("T4", "12", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                           DayOfWeek.init("T5", "13", "08:30 SA", "12:10 CH", "0.5", "Làm ngoài giờ"),
                                                           ]),
                           Week(false, "Tuần 3", "3/5" ,[DayOfWeek.init("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                           DayOfWeek.init("T3", "11", "08:30 SA", "05:30 CH", "1", "Làm trong giờ"),
                                                           DayOfWeek.init("T4", "12", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                           ]),
                           Week(false, "Tuần 4", "5/5" ,[DayOfWeek.init("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                           DayOfWeek.init("T3", "11", "08:30 SA", "05:30 CH", "1", "Làm trong giờ"),
                                                           DayOfWeek.init("T4", "12", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                           DayOfWeek.init("T5", "13", "08:30 SA", "12:10 CH", "0.5", "Làm ngoài giờ"),
                                                           DayOfWeek.init("T6", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ")]),
                           Week(false, "Tuần 5", "5/5" ,[DayOfWeek.init("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                           DayOfWeek.init("T3", "11", "08:30 SA", "05:30 CH", "1", "Làm trong giờ"),
                                                           DayOfWeek.init("T4", "12", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
                                                           DayOfWeek.init("T5", "13", "08:30 SA", "12:10 CH", "0.5", "Làm ngoài giờ"),
                                                           DayOfWeek.init("T6", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ")])
                           
                            ]
    }
    @objc func selectedMenu() {
        print("Chọn chức năng menu")
    }
}
//extension TimeKeepingViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return listTimeKeeping.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if listTimeKeeping[section].isEpand == true {
//            return listTimeKeeping[section].dayOfWeek.count + 1
//        } else {
//            return 1
//        }
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            guard let cell: WeeksTableViewCell = timeKeepingTableView.dequeueReusableCell(withIdentifier: "week", for: indexPath) as? WeeksTableViewCell else {
//                return UITableViewCell()
//            }
//            cell.weekLabel.text = listTimeKeeping[indexPath.section].weekNumber
//            cell.numberDayLabel.text = listTimeKeeping[indexPath.section].totalDay
//            return cell
//        } else {
//            guard let cell: DaysTableViewCell = timeKeepingTableView.dequeueReusableCell(withIdentifier: "day", for: indexPath) as? DaysTableViewCell else {
//                return UITableViewCell()
//            }
//            cell.dayOfWeekLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].weekday
//            cell.dayLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].day
//            cell.timeCheckInLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].checkIn
//            cell.timeCheckOutLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].checkOut
//            cell.statusLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].status
//            cell.timeDayLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].workday
//            return cell
//        }
//    }
//}
//extension TimeKeepingViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            if listTimeKeeping[indexPath.section].isEpand {
//                listTimeKeeping[indexPath.section].isEpand = false
//            } else {
//                listTimeKeeping[indexPath.section].isEpand = true
//            }
//            let sections = IndexSet.init(integer: indexPath.section)
//            timeKeepingTableView.reloadSections(sections, with: .none)
//            if let item = timeKeepingTableView.cellForRow(at: indexPath)?.contentView {
//
//            }
//        } else {
//
//        }
//    }
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        if let item = timeKeepingTableView.cellForRow(at: indexPath)?.contentView {
//
//        }
//    }
//}
