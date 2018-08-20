//
//  TimeKeepingViewController.swift
//  Login
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu

class TimeKeepingViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBAction func prevMonthButton(_ sender: UIButton) {
        print("prevMonthButton")
    }
    @IBAction func nextMonthButton(_ sender: UIButton) {
        print("nextMonthButton")
    }
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var totalNumberDayLabel: UILabel!
    @IBOutlet weak var timeKeepingTableView: UITableView!
    var headerTableView = [Week]()
    var childHeaderTableView = [[DayOfWeek]]()
    // MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        register()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        SideMenuManager.default.menuAddPanGestureToPresent(toView: mainView)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: mainView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func register() {
        timeKeepingTableView.register(UINib(nibName: "DaysTableViewCell", bundle: nil),
                                      forCellReuseIdentifier: "DaysTableViewCell")
        timeKeepingTableView.register(UINib(nibName: "WeeksTableViewCell",
                                            bundle: nil), forHeaderFooterViewReuseIdentifier: "WeeksTableViewCell")
    }
    // MARK: initView
    func initView() {
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "CHẤM CÔNG"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor =
            UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconMenu"),
                                                           style: .plain, target: self, action: #selector(selectedMenu))
        headerTableView = [Week(false, "Tuần 1", "5/5"),
                           Week(false, "Tuần 2", "4/5"),
                           Week(false, "Tuần 3", "3/5"),
                           Week(false, "Tuần 4", "5/5"),
                           Week(false, "Tuần 5", "2/5")
                        ]
        childHeaderTableView = [
            [DayOfWeek("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "08:30 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T4", "12", "08:30 SA", "Quên chấm công?", "1", "Công ty"),
             DayOfWeek("T5", "13", "08:30 SA", "12:00 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T6", "14", "-", "-", "1", "Làm ngoài giờ"),
             DayOfWeek("T7", "15", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ"),
             DayOfWeek("CN", "16", "08:30 SA", "12:00 SA", "1", "Làm ngoài giờ")
            ],
            [DayOfWeek("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "05:30 CH", "1", "Công ty"),
             DayOfWeek("T4", "12", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ"),
             DayOfWeek("T5", "13", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ")
             ],
            [DayOfWeek("T2", "10", "08:30 SA", "12:00 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "08:30 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T4", "12", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ")
             ],
            [DayOfWeek("T2", "10", "-", "-", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "05:30 CH", "1", "OT"),
             DayOfWeek("T4", "12", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ"),
             DayOfWeek("T5", "13", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T6", "14", "08:30 SA", "12:00 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T7", "15", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ")
             ],
            [DayOfWeek("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ")
             ]
        ]
    }
    @objc func selectedMenu() {
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else {
            return
        }
        present(sideMenu, animated: true, completion: nil)
    }
}
extension TimeKeepingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: DaysTableViewCell =
            tableView.dequeueReusableCell(withIdentifier: "DaysTableViewCell",
                                          for: indexPath) as? DaysTableViewCell else {
            return UITableViewCell()
        }
        setUICell(cell, indexPath.section, indexPath.row)
        return cell
    }
    func setUICell(_ cell: DaysTableViewCell, _ section: Int, _ row: Int) {
        cell.dayLabel.text = childHeaderTableView[section][row].day
        cell.dayOfWeekLabel.text = childHeaderTableView[section][row].weekday
        let day = childHeaderTableView[section][row].weekday
        if day.isEqual("T7") || day.isEqual("CN") {
            cell.dayLabel.backgroundColor = UIColor(red: 242/255, green: 81/255, blue: 95/255, alpha: 1)
            cell.dayOfWeekLabel.textColor = UIColor(red: 242/255, green: 81/255, blue: 95/255, alpha: 1)
        } else {
            cell.dayLabel.backgroundColor = UIColor(red: 56/255, green: 102/255, blue: 201/255, alpha: 1)
            cell.dayOfWeekLabel.textColor = UIColor(red: 56/255, green: 102/255, blue: 201/255, alpha: 1)
        }
        cell.timeCheckInLabel.text = childHeaderTableView[section][row].checkIn
        let timeCheckOut = childHeaderTableView[section][row].checkOut
        if timeCheckOut.isEqual("Quên chấm công?") {
            cell.statusLabel.isHidden = false
            cell.dayWarningLabel.isHidden = true
            cell.requestButton.isHidden = true
            cell.warningRequestLabel.isHidden = true
            cell.timeCheckOutLabel.text = childHeaderTableView[section][row].checkOut
            cell.timeCheckOutLabel.backgroundColor = UIColor(red: 207/255, green: 2/255, blue: 27/255, alpha: 1)
            cell.statusLabel.text = ""
            cell.timeDayLabel.text = "0"
            cell.timeCheckOutLabel.textColor = UIColor.black
        } else if timeCheckOut.isEqual("08:30 SA") {
            cell.statusLabel.isHidden = false
            cell.warningRequestLabel.isHidden = false
            cell.dayWarningLabel.isHidden = true
            cell.requestButton.isHidden = true
            cell.timeCheckOutLabel.text = childHeaderTableView[section][row].checkOut
            cell.timeCheckOutLabel.textColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
            cell.statusLabel.text = ""
            cell.timeDayLabel.text = "0"
            cell.timeCheckOutLabel.backgroundColor = UIColor.clear
        } else if timeCheckOut.isEqual("12:00 SA") {
            cell.timeCheckOutLabel.text = childHeaderTableView[section][row].checkOut
            cell.statusLabel.isHidden = true
            cell.dayWarningLabel.isHidden = false
            cell.requestButton.isHidden = false
            cell.warningRequestLabel.isHidden = true
            cell.dayWarningLabel.text = "0.5"
            cell.timeDayLabel.text = "0.5"
            cell.requestButton.setTitle("P", for: .normal)
            cell.timeCheckOutLabel.backgroundColor = UIColor.clear
            cell.requestButton.backgroundColor = UIColor(red: 61/255, green: 182/255, blue: 96/255, alpha: 1)
            cell.timeCheckOutLabel.textColor = UIColor.black
        } else if timeCheckOut.isEqual("-") {
            cell.timeCheckOutLabel.text = childHeaderTableView[section][row].checkOut
            cell.timeDayLabel.text = "0"
            cell.statusLabel.isHidden = true
            cell.dayWarningLabel.isHidden = false
            cell.requestButton.isHidden = false
            cell.warningRequestLabel.isHidden = true
            cell.dayWarningLabel.text = "1"
            cell.requestButton.setTitle("!", for: .normal)
            cell.timeCheckOutLabel.backgroundColor = UIColor.clear
            cell.requestButton.backgroundColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
            cell.timeCheckOutLabel.textColor = UIColor.black
        } else {
            cell.statusLabel.isHidden = false
            cell.dayWarningLabel.isHidden = true
            cell.requestButton.isHidden = true
            cell.warningRequestLabel.isHidden = true
            cell.timeCheckOutLabel.text = childHeaderTableView[section][row].checkOut
            cell.statusLabel.text = childHeaderTableView[section][row].status
            cell.timeDayLabel.text = childHeaderTableView[section][row].workday
            cell.timeCheckOutLabel.backgroundColor = UIColor.clear
            cell.timeCheckOutLabel.textColor = UIColor.black
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTableView.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if headerTableView[section].isEpand {
            return childHeaderTableView[section].count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header: WeeksTableViewCell =
            tableView.dequeueReusableHeaderFooterView(withIdentifier: "WeeksTableViewCell")
            as? WeeksTableViewCell else {
            return UITableViewHeaderFooterView()
        }
        header.weekLabel.text = headerTableView[section].weekNumber
        header.numberDayLabel.text = headerTableView[section].totalDay
        header.section = section
        header.delegate = self
        header.isExpand(headerTableView[section].isEpand)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
extension TimeKeepingViewController: WeeksTableViewCellDelegate {
    func touchHeader(_ header: WeeksTableViewCell, _ section: Int) {
        let isEpand = !headerTableView[section].isEpand
        headerTableView[section].isEpand = isEpand
        timeKeepingTableView.reloadData()
    }
}
extension TimeKeepingViewController: UITableViewDelegate {

}
