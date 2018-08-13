//
//  TimeKeepingViewController.swift
//  Session2
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TimeKeepingViewController: UIViewController {
    var listTimeKeeping: [TimeKeeping] = []
    var weekSectionHeader = [TimeKeeping]()
    var rowOfSection = [DayOfWeek]()
    var tableList = [selectionData]()
    
    @IBOutlet weak var weekTableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        weekSectionHeader = [TimeKeeping(isExpand: true, week: "Tuần 3", day: "5/5"),
                             TimeKeeping(isExpand: true, week: "Tuần 3", day: "5/5"),
                             TimeKeeping(isExpand: true, week: "Tuần 3", day: "5/5"),
                             TimeKeeping(isExpand: true, week: "Tuần 3", day: "5/5")]
        
        rowOfSection = [DayOfWeek(weekday: "T2", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday:             "1", status: "Đang làm việc"),
                        DayOfWeek(weekday: "T3", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
                        DayOfWeek(weekday: "T4", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
                        DayOfWeek(weekday: "T5", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
                        DayOfWeek(weekday: "T6", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
                        DayOfWeek(weekday: "T7", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
                        DayOfWeek(weekday: "CN", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc")]
                        
//                        [DayOfWeek(weekday: "T2", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday:             "1", status: "Đang làm việc"),
//                        DayOfWeek(weekday: "T3", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
//                        DayOfWeek(weekday: "T4", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc")],
//
//                        [DayOfWeek(weekday: "T2", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday:             "1", status: "Đang làm việc"),
//                        DayOfWeek(weekday: "T3", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
//                        DayOfWeek(weekday: "T4", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc")],
//
//                        [DayOfWeek(weekday: "T2", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday:             "1", status: "Đang làm việc"),
//                        DayOfWeek(weekday: "T3", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc"),
//                        DayOfWeek(weekday: "T4", day: "15", checkIn: "08:00 SA", checkOut: "05:00 CH", workday: "1", status: "Đang làm việc")]]
        
//        tableList = [selectionData(isExpand: false, celData: ["a","b","c","d"]),
//                     selectionData(isExpand: false, celData: ["1","2","3","4"]),
//                     selectionData(isExpand: false, celData: ["a","b","c","d"]),
//                     selectionData(isExpand: false, celData: ["a","b","c","d"])]
       
       
        weekTableView.dataSource = self
        weekTableView.delegate = self
        weekTableView.register(UINib(nibName: "WeekTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "WeekTableViewCell")
        weekTableView.register(UINib(nibName: "DayTableViewCell", bundle: nil), forCellReuseIdentifier: "DayTableViewCell")
        
        
        initNav()
        
        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    // MARK: Navigation
    func initNav(){
        navigationItem.title = "CHẤM CÔNG"
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu"), style: .plain, target: self, action: #selector(onBack))
    }
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }
    
   


}
extension TimeKeepingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Cham")
//        print("did select row at \(indexPath.row) in section \(indexPath.section)")
//
//        if indexPath.row == 0 {
//            if listTimeKeeping[indexPath.section].isExpand {
//                listTimeKeeping[indexPath.section].isExpand = false
//            } else {
//                listTimeKeeping[indexPath.section].isExpand = true
//            }
//            tableView.reloadData()
        
         //   reload table view
//            let sections = IndexSet.init(integer: indexPath.section)
//            weekTableView.reloadSections(sections, with: .none)
//
//            if listTimeKeeping[indexPath.section].isExpand {
//                if let item = tableView.cellForRow(at: indexPath) {
//                    print("set Expand on section \(indexPath.section)")
//                    item.setIsTableViewExpand(true)
//                }
//            } else {
//                if let item = tableView.cellForRow(at: indexPath){
//                    print("set Unexpand on section \(indexPath.section)")
//                    item.setIsTableViewExpand(false)
//
//
//                }
//            }
//        } else {
//
//        }
        
        
    }
    
}
extension TimeKeepingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
       return weekSectionHeader.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowOfSection.count
       
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell: DayTableViewCell = weekTableView.dequeueReusableCell(withIdentifier: "DayTableViewCell", for: indexPath) as? DayTableViewCell else {
                return UITableViewCell()
            }
            cell.checkInLabel.text = rowOfSection[indexPath.row].checkIn
            cell.checkOutLabel.text = rowOfSection[indexPath.row].checkOut
            cell.dayLabel.text = rowOfSection[indexPath.row].day
            cell.statusLabel.text = rowOfSection[indexPath.row].status
            cell.workDayLabel.text = rowOfSection[indexPath.row].workday
            cell.weekDayLabel.text = rowOfSection[indexPath.row].weekday
            return cell
   
       
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell: WeekTableViewCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "WeekTableViewCell") as? WeekTableViewCell else {
            return UITableViewHeaderFooterView()
        }
        cell.dayLabel.text = weekSectionHeader[section].day
        cell.weekLabel.text = weekSectionHeader[section].week
       
        
        return cell
    }
    
  
}
struct selectionData {
    var isExpand = Bool()
    var celData: [String] = []
}
    


