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
    var tableList = [selectionData]()
    
    @IBOutlet weak var weekTableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableList = [selectionData(isExpand: false, celData: ["a","b","c","d"]),selectionData(isExpand: false, celData: ["1","2","3","4"]), selectionData(isExpand: false, celData: ["a","b","c","d"]), selectionData(isExpand: false, celData: ["a","b","c","d"])]
       
        let timeKeeping = TimeKeeping(isExpand: true, week: "Tuan 3", day: "5/5", dayOfWeek: [DayOfWeek(weekday: "T2", day: "15", checkIn: "08:00 SA", checkOut: "05: 00 CH", workday: "1 ngay", status: "Dang lam viec")])
        listTimeKeeping.append(timeKeeping)
       
        weekTableView.dataSource = self
        weekTableView.delegate = self
        weekTableView.register(UINib(nibName: "WeekTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        weekTableView.register(UINib(nibName: "DayTableViewCell", bundle: nil), forCellReuseIdentifier: "day")
        
        
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
        print("Cham")
        print("did select row at \(indexPath.row) in section \(indexPath.section)")
        if indexPath.row == 0 {
            if tableList[indexPath.section].isExpand {
                tableList[indexPath.section].isExpand = false
            } else {
                tableList[indexPath.section].isExpand = true
            }
            
            //reload table view
            let sections = IndexSet.init(integer: indexPath.section)
            weekTableView.reloadSections(sections, with: .none)
            
            if tableList[indexPath.section].isExpand {
                if let item = weekTableView.cellForRow(at: indexPath)?.contentView {
                    print("set Expand on section \(indexPath.section)")
                    item.setIsOnExpand(true)
                }
            } else {
                if let item = weekTableView.cellForRow(at: indexPath)?.contentView {
                    print("set Unexpand on section \(indexPath.section)")
                    item.setIsOnExpand(false)
                }
            }
        } else {
            
        }
        
        
    }
    
}
extension TimeKeepingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberRow = tableList[section].celData.count + 1
        if tableList[section].isExpand {
            print("number of row in section \(section) = \(numberRow)")
            return numberRow
        } else {
            print("number of row in section = 1")
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell: WeekTableViewCell = weekTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeekTableViewCell else {
                return UITableViewCell()
            }
            cell.weekLabel.text = "Tuần " + (indexPath.section + 1).description
         
            return cell
        } else {
            guard let cell: DayTableViewCell = weekTableView.dequeueReusableCell(withIdentifier: "day", for: indexPath) as? DayTableViewCell else {
                return UITableViewCell()
            }
            
            cell.checkOutLabel.text = tableList[indexPath.section].celData[indexPath.row - 1]
            let day = indexPath.row + 1
            if day <= 7 {
                cell.weekDayLabel.text = "T" + (day).description
            } else {
                cell.weekDayLabel.text = "CN"
            }
            
            
            return cell
        }
       
       
        
    }
}
struct selectionData {
    var isExpand = Bool()
    var celData: [String] = []
}
    


