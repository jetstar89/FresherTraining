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
        dataTableView = [sectionData(isExpand: false, cellData: ["a", "b", "c", "d", "e", "f", "g"]),
                         sectionData(isExpand: false, cellData: ["h", "i", "j", "k", "l", "m", "n"]),
                         sectionData(isExpand: false, cellData: ["1", "2", "3", "4", "5", "6", "7"]),
                         sectionData(isExpand: false, cellData: ["8", "9", "10", "11", "12", "13", "14"])]
        
        timeKeepingTableView.register(UINib(nibName: "TimeKeepingHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        timeKeepingTableView.register(UINib(nibName: "DayTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
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
    
    // MARK: - Selector
    
    @objc func onExpandSection(_ sender: UITapGestureRecognizer) {
        //print("did select row at \(indexPath.row) in section \(indexPath.section)")
//        if dataTableView[section].isExpand {
//            dataTableView[section].isExpand = false
//        } else {
//                dataTableView[section].isExpand = true
//        }
//        tableView.reloadData()
        print("tap on header")
    }
    
    // MARK: - IBAction
}

// MARK: - Extention

extension TimeKeepingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataTableView.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberRow = dataTableView[section].cellData.count
        if dataTableView[section].isExpand {
            print("number of row in section \(section) = \(numberRow)")
            return numberRow
        } else {
            print("number of row in section = 0")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: DayTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DayTableViewCell else {return UITableViewCell()}
            
        cell.afternoonChekingTimeLabel.text = dataTableView[indexPath.section].cellData[indexPath.row]
            
        let day = indexPath.row + 2
        if day <= 7 {
            cell.weekdayLabel.text = "T" + (day).description
        } else {
            cell.weekdayLabel.text = "CN"
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(3)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? TimeKeepingHeaderView else { return UIView() }
        
        header.section = section
        header.delegate = self
        return header
    }
}

extension TimeKeepingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("did select row at \(indexPath.row) in section \(indexPath.section)")
//        if indexPath.row == 0 {
//            if dataTableView[indexPath.section].isExpand {
//                dataTableView[indexPath.section].isExpand = false
//            } else {
//                dataTableView[indexPath.section].isExpand = true
//            }
//            tableView.reloadData()
//        } else {
//
//        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}

extension TimeKeepingViewController: ExpandTableViewHeaderDelegate {
    func toggleSection(header: TimeKeepingHeaderView, section: Int) {
        let expand = !dataTableView[section].isExpand
        
        print("toggleSection \(section)")
        
        // Toggle expand
        dataTableView[section].isExpand = expand
        
        // Reload the whole section
       
        timeKeepingTableView.reloadData()
    }
}

struct sectionData {
    var isExpand = Bool()
    var cellData = [String]()
    
}
