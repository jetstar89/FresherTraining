//
//  TimeKeepingViewController.swift
//  Session2
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu

class TimeKeepingViewController: UIViewController, WeekTableDelegate {
    var listTimeKeeping: [TimeKeepingSection] = []
    @IBOutlet weak var weekTableView: UITableView!
    var selectIndexPath: IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        selectIndexPath = IndexPath(row: -1, section: -1)
        weekTableView.dataSource = self
        weekTableView.delegate = self
        weekTableView.register(UINib(
            nibName: "WeekTableViewCell", bundle: nil),
            forHeaderFooterViewReuseIdentifier: "WeekTableViewCell")
        weekTableView.register(UINib(
            nibName: "DayTableViewCell", bundle: nil),
            forCellReuseIdentifier: "DayTableViewCell")
        initNav()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Select menu
    @objc func onShowLeftMenu(_ sender: MainNavigationController) {
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else { return }
        present(sideMenu, animated: true, completion: nil)
    }
    // MARK: Navigation and function
    func initNav() {
        navigationItem.title = "CHẤM CÔNG"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(onShowLeftMenu(_:)))
    }
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }
    func touchSelection(header: WeekTableViewCell, section: Int) {
        listTimeKeeping[section].isExpand = !listTimeKeeping[section].isExpand
        weekTableView.beginUpdates()
        weekTableView.reloadSections([section], with: .automatic)
        weekTableView.endUpdates()
    }
    func initData() {
        let dayOfWeek = [DayOfWeek(weekday: "T2", day: "15", checkIn: "08:00 SA",
                                   checkOut: "Quên chấm công", workday: "1", status: "Đang làm việc"),
                         DayOfWeek(weekday: "T3", day: "15", checkIn: "08:00 SA",
                                   checkOut: "08:00 SA", workday: "1", status: "Đang làm việc"),
                         DayOfWeek(weekday: "T4", day: "15", checkIn: "08:00 SA",
                                   checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
                         DayOfWeek(weekday: "T5", day: "15", checkIn: "08:00 SA",
                                   checkOut: "12:00 SA", workday: "1",
                                   status: "Đang làm việc"),
                         DayOfWeek(weekday: "T6", day: "15", checkIn: "08:00 SA",
                                   checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
                         DayOfWeek(weekday: "T7", day: "15", checkIn: "08:00 SA",
                                   checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
                         DayOfWeek(weekday: "CN", day: "15", checkIn: "08:00 SA",
                                   checkOut: "05:00 CH", workday: "1", status: "Đang làm việc")]
        listTimeKeeping = [TimeKeepingSection(isExpand: false, week: "Tuần 1", day: "1/5", dayOfWeek: dayOfWeek),
                           TimeKeepingSection(isExpand: false, week: "Tuần 2", day: "2/5", dayOfWeek: dayOfWeek),
                           TimeKeepingSection(isExpand: false, week: "Tuần 3", day: "3/5", dayOfWeek: dayOfWeek),
                           TimeKeepingSection(isExpand: false, week: "Tuần 4", day: "4/5", dayOfWeek: dayOfWeek)]
    }
}
extension TimeKeepingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 58
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if listTimeKeeping[indexPath.section].isExpand == true {
            return UITableViewAutomaticDimension
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.selectIndexPath = indexPath
        listTimeKeeping[indexPath.section].isExpand = !listTimeKeeping[indexPath.section].isExpand
        weekTableView.beginUpdates()
//        weekTableView.reloadSections([indexPath.section], with: .automatic)
        weekTableView.endUpdates()
    }
}
extension TimeKeepingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
       return listTimeKeeping.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTimeKeeping[section].dayOfWeek.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell: DayTableViewCell =
                weekTableView.dequeueReusableCell(withIdentifier: "DayTableViewCell", for: indexPath)
                    as? DayTableViewCell else {
                return UITableViewCell()
            }
            cell.customInit(weekDay: listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row].weekday,
                            status: listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row].status,
                            checkIn: listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row].checkIn,
                            checkOut: listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row].checkOut,
                            workDay: listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row].workday,
                            day: listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row].day,
                            section: indexPath.section)

            return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView: WeekTableViewCell = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "WeekTableViewCell")
            as? WeekTableViewCell else {
            return UITableViewHeaderFooterView()
        }
        headerView.customInit(week: listTimeKeeping[section].week,
                              day: listTimeKeeping[section].day,
                              section: section,
                              isOnExpand: listTimeKeeping[section].isExpand,
                              delegate: self)
        return headerView
    }
}
