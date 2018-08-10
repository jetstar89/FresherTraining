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
        tableList = [selectionData(isExpand: true, celData: ["a","b","c","d"]),selectionData(isExpand: true, celData: ["1","2",""])]
       
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
        
    }
    
}
extension TimeKeepingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTimeKeeping.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell: WeekTableViewCell = weekTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeekTableViewCell else {
                return UITableViewCell()
            }
            cell.weekLabel.text = listTimeKeeping[indexPath.row].week
            cell.dayLabel.text = listTimeKeeping[indexPath.row].day
            return cell
        } else {
            guard let cell: DayTableViewCell = weekTableView.dequeueReusableCell(withIdentifier: "day", for: indexPath) as? DayTableViewCell else {
                return UITableViewCell()
            }
            
            
            return cell
        }
       
       
        
    }
}
struct selectionData {
    var isExpand = Bool()
    var celData: [String] = []
}
    


