//
//  TimeKeepingViewController.swift
//  DemoUIComponents
//
//  Created by Đinh Ngọc Vũ on 8/9/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class TimeKeepingViewController: UIViewController {
    
    var dataTableView = [sectionData]()
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var timeKeepingTableView: UITableView!
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView = [sectionData(isExpand: false, cellData: ["a", "b", "c", "d", "e", "f", "g"]),sectionData(isExpand: false, cellData: ["h", "i", "j", "k", "l", "m", "n"]),sectionData(isExpand: false, cellData: ["1", "2", "3", "4", "5", "6", "7"]),sectionData(isExpand: false, cellData: ["8", "9", "10", "11", "12", "13", "14"])]
        
        timeKeepingTableView.register(UINib(nibName: "WeekTableViewCell", bundle: nil), forCellReuseIdentifier: "week")
        timeKeepingTableView.register(UINib(nibName: "DayTableViewCell", bundle: nil), forCellReuseIdentifier: "day")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let navigationBar = navigationController?.navigationBar else {return}
        navigationBar.isHidden = false
        navigationBar.barTintColor = UIColor.frenchBlue
        navigationBar.tintColor = UIColor.white
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.title = "CHẤM CÔNG"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction
}

extension TimeKeepingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataTableView.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberRow = dataTableView[section].cellData.count + 1
        if dataTableView[section].isExpand {
            print("number of row in section \(section) = \(numberRow)")
            return numberRow
        } else {
            print("number of row in section = 1")
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell: WeekTableViewCell = tableView.dequeueReusableCell(withIdentifier: "week", for: indexPath) as? WeekTableViewCell else {return UITableViewCell()}
            cell.weekLabel.text = "Tuần " + (indexPath.section + 1).description
            return cell
        } else {
            guard let cell: DayTableViewCell = tableView.dequeueReusableCell(withIdentifier: "day", for: indexPath) as? DayTableViewCell else {return UITableViewCell()}
            
            cell.afternoonChekingTimeLabel.text = dataTableView[indexPath.section].cellData[indexPath.row - 1]
            let day = indexPath.row + 1
            if day <= 7 {
                cell.WeekdayLabel.text = "T" + (day).description
            } else {
                cell.WeekdayLabel.text = "CN"
            }
            
            return cell
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

extension TimeKeepingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select row at \(indexPath.row) in section \(indexPath.section)")
        if indexPath.row == 0 {
            if dataTableView[indexPath.section].isExpand {
                dataTableView[indexPath.section].isExpand = false
            } else {
                dataTableView[indexPath.section].isExpand = true
            }
            
            //reload table view
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            
            if dataTableView[indexPath.section].isExpand {
                if let item = tableView.cellForRow(at: indexPath)?.contentView {
                    print("set Expand on section \(indexPath.section)")
                    item.setIsOnExpand(true)
                }
            } else {
                if let item = tableView.cellForRow(at: indexPath)?.contentView {
                    print("set Unexpand on section \(indexPath.section)")
                    item.setIsOnExpand(false)
                }
            }
        } else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}

struct sectionData {
    var isExpand = Bool()
    var cellData = [String]()
    
}
