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
       
        let timeKeeping = TimeKeeping(isExpand: false, week: "Tuần 3", day: "5/5", dayOfWeek: [DayOfWeek(weekday: "T2", day: "15", checkIn: "08:00 SA", checkOut: "05: 00 CH", workday: "1", status: "Đang làm việc")])
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
            if listTimeKeeping[indexPath.section].isExpand {
                listTimeKeeping[indexPath.section].isExpand = false
            } else {
                listTimeKeeping[indexPath.section].isExpand = true
            }
            
            //reload table view
            let sections = IndexSet.init(integer: indexPath.section)
            weekTableView.reloadSections(sections, with: .none)
            
            if listTimeKeeping[indexPath.section].isExpand {
                if let item = tableView.cellForRow(at: indexPath) {
                    print("set Expand on section \(indexPath.section)")
                    item.setIsTableViewExpand(true)
                   
                    
                }
            } else {
                if let item = tableView.cellForRow(at: indexPath){
                    print("set Unexpand on section \(indexPath.section)")
                    item.setIsTableViewExpand(false)
                   
                 
                }
            }
        } else {
            
        }
        
        
    }
    
}
extension TimeKeepingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return listTimeKeeping.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberRow = listTimeKeeping[section].dayOfWeek.count + 1
        
        if listTimeKeeping[section].isExpand {
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
            cell.weekLabel.text = listTimeKeeping[indexPath.section].week
            cell.dayLabel.text  = listTimeKeeping[indexPath.section].day
         
            return cell
        } else {
            guard let cell: DayTableViewCell = weekTableView.dequeueReusableCell(withIdentifier: "day", for: indexPath) as? DayTableViewCell else {
                return UITableViewCell()
            }
            
            
            cell.checkOutLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].checkOut
            cell.checkInLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].checkIn
            cell.weekDayLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].weekday
            cell.dayLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].day
            cell.statusLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].status
            cell.workDayLabel.text = listTimeKeeping[indexPath.section].dayOfWeek[indexPath.row - 1].workday
         
            
            
            return cell
        }
       
       
        
    }
}
struct selectionData {
    var isExpand = Bool()
    var celData: [String] = []
}
    


