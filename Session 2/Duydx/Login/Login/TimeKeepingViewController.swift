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
    var headerTableView = [Week]()
    var childHeaderTableView = [[DayOfWeek]]()
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
        timeKeepingTableView.register(UINib(nibName: "DaysTableViewCell", bundle: nil), forCellReuseIdentifier: "DaysTableViewCell")
        timeKeepingTableView.register(UINib(nibName: "WeeksTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "WeeksTableViewCell")
    }
    
    //MARK: initView
    func initView() {
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "CHẤM CÔNG"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconMenu"), style: .plain, target: self, action: #selector(selectedMenu))
        headerTableView = [Week(false, "Tuần 1", "5/5"),
                           Week(false, "Tuần 2", "4/5"),
                           Week(false, "Tuần 3", "3/5"),
                           Week(false, "Tuần 4", "5/5"),
                           Week(false, "Tuần 5", "2/5")
                        ]
        childHeaderTableView = [
            [DayOfWeek("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "08:30 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T4", "12", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ"),
             DayOfWeek("T5", "13", "08:30 SA", "12:00 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T6", "14", "-", "-", "1", "Làm ngoài giờ"),
             DayOfWeek("T7", "15", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ"),
            ],
            [DayOfWeek("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T4", "12", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ"),
             DayOfWeek("T5", "13", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             
             ],
            [DayOfWeek("T2", "10", "08:30 SA", "12:00 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "08:30 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T4", "12", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ"),
             
             ],
            [DayOfWeek("T2", "10", "-", "-", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T4", "12", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ"),
             DayOfWeek("T5", "13", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T6", "14", "08:30 SA", "12:00 SA", "1", "Làm ngoài giờ"),
             DayOfWeek("T7", "15", "08:30 SA", "Quên chấm công?", "1", "Làm ngoài giờ"),
             ],
            [DayOfWeek("T2", "10", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             DayOfWeek("T3", "11", "08:30 SA", "05:30 CH", "1", "Làm ngoài giờ"),
             ]
        ]
    }
    @objc func selectedMenu() {
        navigationController?.popViewController(animated: true)
    }
}
extension TimeKeepingViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: DaysTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DaysTableViewCell", for: indexPath) as? DaysTableViewCell else {
            return UITableViewCell()
        }
        cell.dayLabel.text = childHeaderTableView[indexPath.section][indexPath.row].day
        cell.dayOfWeekLabel.text = childHeaderTableView[indexPath.section][indexPath.row].weekday
        let timeCheckOut = childHeaderTableView[indexPath.section][indexPath.row].checkOut
        if timeCheckOut.isEqual("Quên chấm công?") {
            cell.dayWarningLabel.isHidden = true
            cell.requestButton.isHidden = true
            cell.timeCheckInLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkIn
            cell.timeCheckOutLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkOut
            cell.timeCheckOutLabel.backgroundColor = UIColor(red: 207/255, green: 2/255, blue: 27/255, alpha: 1)
            cell.statusLabel.text = ""
            cell.timeDayLabel.text = "0"
            cell.warningRequestLabel.isHidden = true
        } else if timeCheckOut.isEqual("08:30 SA"){
            cell.dayWarningLabel.isHidden = true
            cell.requestButton.isHidden = true
            cell.timeCheckInLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkIn
            cell.timeCheckOutLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkOut
            cell.timeCheckOutLabel.textColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
            cell.statusLabel.text = ""
            cell.timeDayLabel.text = "0"
            cell.warningRequestLabel.isHidden = false
            cell.timeCheckOutLabel.backgroundColor = UIColor.clear
        } else if timeCheckOut.isEqual("12:00 SA"){
            cell.timeCheckInLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkIn
            cell.timeCheckOutLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkOut
            cell.timeDayLabel.text = "0.5"
            cell.statusLabel.isHidden = true
            cell.dayWarningLabel.isHidden = false
            cell.requestButton.isHidden = false
            cell.dayWarningLabel.text = "0.5"
            cell.requestButton.setTitle("P", for: .normal)
            cell.timeCheckOutLabel.backgroundColor = UIColor.clear
            cell.requestButton.backgroundColor = UIColor(red: 61/255, green: 182/255, blue: 96/255, alpha: 1)
        } else if timeCheckOut.isEqual("-"){
            cell.timeCheckInLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkIn
            cell.timeCheckOutLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkOut
            cell.timeDayLabel.text = "0"
            cell.statusLabel.isHidden = true
            cell.dayWarningLabel.isHidden = false
            cell.requestButton.isHidden = false
            cell.dayWarningLabel.text = "0.5"
            cell.timeCheckOutLabel.backgroundColor = UIColor.clear
            cell.requestButton.setTitle("!", for: .normal)
            cell.requestButton.backgroundColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
        } else {
            cell.statusLabel.isHidden = false
            cell.dayWarningLabel.isHidden = true
            cell.requestButton.isHidden = true
            cell.timeCheckInLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkIn
            cell.timeCheckOutLabel.text = childHeaderTableView[indexPath.section][indexPath.row].checkOut
            cell.statusLabel.text = childHeaderTableView[indexPath.section][indexPath.row].status
            cell.timeDayLabel.text = childHeaderTableView[indexPath.section][indexPath.row].workday
            cell.warningRequestLabel.isHidden = true
            cell.timeCheckOutLabel.backgroundColor = UIColor.clear
            cell.timeCheckOutLabel.textColor = UIColor.white
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTableView.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Chirlen: \(childHeaderTableView[section].count)")
        return childHeaderTableView[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header: WeeksTableViewCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "WeeksTableViewCell") as? WeeksTableViewCell else {
            return UITableViewHeaderFooterView()
        }
        header.weekLabel.text = headerTableView[section].weekNumber
        header.numberDayLabel.text = headerTableView[section].totalDay
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension TimeKeepingViewController: UITableViewDelegate {

}
