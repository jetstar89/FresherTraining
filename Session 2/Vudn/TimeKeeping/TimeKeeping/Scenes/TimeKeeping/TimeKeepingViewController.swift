//
//  TimeKeepingViewController.swift
//  DemoUIComponents
//
//  Created by Đinh Ngọc Vũ on 8/9/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import SideMenu

class TimeKeepingViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var timeKeepingTableView: UITableView!
    
    // MARK: - Variable
    var tableViewData = [SectionData]()
    let tag = "TimeKeepingViewController"
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeKeepingTableView.register(UINib(nibName: "TimeKeepingTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        timeKeepingTableView.register(UINib(nibName: "TimeKeepingTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        createData()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.isHidden = false
            SideMenuManager.default.menuAddPanGestureToPresent(toView: navigationBar)
            SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: navigationBar)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
    }
    
    // MARK: - Selector
    
    @objc func onShowLeftMenu(_ sender: MainNavigationController) {
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else { return }
        present(sideMenu, animated: true, completion: nil)
    }
    
    // MARK: - IBAction
    
    // MARK: - Func
    
    func createData() {
        tableViewData = [
            SectionData([
                CellData(day: 1, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 2, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 3, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 4, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 5, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 6, checkIn: "-", checkOut: "-", requestStatus: 0, timeWorking: 0, timeVacation: 0, vacationType: 0, reasonComment: "-", locationComment: ""),
                CellData(day: 7, checkIn: "-", checkOut: "-", requestStatus: 0, timeWorking: 0, timeVacation: 0, vacationType: 0, reasonComment: "-", locationComment: "")
                ]),
            SectionData([
                CellData(day: 8, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 9, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 10, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 11, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 12, checkIn: "08:00 SA", checkOut: "04:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 13, checkIn: "-", checkOut: "-", requestStatus: 0, timeWorking: 0, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 14, checkIn: "-", checkOut: "-", requestStatus: 0, timeWorking: 0, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: "")
                ]),
            SectionData([
                CellData(day: 15, checkIn: "08:00 SA", checkOut: "05:30 CH", requestStatus: 0, timeWorking: 1, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: "Ngoài công ty"),
                CellData(day: 16, checkIn: "08:00 SA", checkOut: "-", requestStatus: 0, timeWorking: 0, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 17, checkIn: "08:00 SA", checkOut: "08:00 SA", requestStatus: 1, timeWorking: 0, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 18, checkIn: "08:00 SA", checkOut: "12:00 SA", requestStatus: 0, timeWorking: 0.5, timeVacation: 0.5, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 19, checkIn: "08:00 SA", checkOut: "04:30", requestStatus: 0, timeWorking: 0.82, timeVacation: 0, vacationType: 0, reasonComment: "Làm bù", locationComment: "Ngoài công ty"),
                CellData(day: 20, checkIn: "-", checkOut: "-", requestStatus: 0, timeWorking: 0, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: ""),
                CellData(day: 21, checkIn: "-", checkOut: "-", requestStatus: 0, timeWorking: 0, timeVacation: 0, vacationType: 0, reasonComment: "", locationComment: "")
                ]),
            SectionData([
                ])
        ]
    }
    
    func setupNavigationBar() {
        navigationItem.title = "CHẤM CÔNG"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"), style: .plain, target: self, action: #selector(onShowLeftMenu(_:)))
    }
}

// MARK: - Extention

extension TimeKeepingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberRow = tableViewData[section].cellData.count
        if tableViewData[section].isExpand {
            print("number of row in section \(section) = \(numberRow)")
            return numberRow
        } else {
            print("number of row in section = 0")
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TimeKeepingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TimeKeepingTableViewCell else {return UITableViewCell()}
        
        cell.setData(tableViewData[indexPath.section].cellData[indexPath.row], cellForRowAt: indexPath)
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
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? TimeKeepingTableViewHeader else { return UIView() }
        
        header.section = section
        header.delegate = self
        header.setIsOnExpand(tableViewData[section].isExpand)
        
        let week = section + 1
        header.weekLabel.text = "Tuần \(week)"
        
        var sumTimeWorking: Float = 0
        for item in tableViewData[section].cellData {
            sumTimeWorking += item.timeWorking
        }
        header.countDayLabel.text = "\(sumTimeWorking)/5"
        
        return header
    }
}

extension TimeKeepingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}

extension TimeKeepingViewController: ExpandTableViewHeaderDelegate {
    func toggleSection(header: TimeKeepingTableViewHeader, section: Int) {
        let expand = !tableViewData[section].isExpand
        
        print("toggleSection \(section)")
        
        // Toggle expand
        tableViewData[section].isExpand = expand
        
        // Reload the whole section
       
        timeKeepingTableView.reloadData()
    }
}

struct SectionData {
    var isExpand: Bool
    var cellData: [CellData]
    
    init(_ cellData: [CellData]) {
        self.cellData = cellData
        isExpand = false
    }
}

struct CellData {
    var day: Int
    var checkIn: String
    var checkOut: String
    var requestStatus: Int
    var timeWorking: Float
    var timeVacation: Float
    var vacationType: Int
    var reasonComment: String
    var locationComment: String
    
    init(day: Int, checkIn: String, checkOut: String, requestStatus: Int, timeWorking: Float, timeVacation: Float, vacationType: Int, reasonComment: String, locationComment: String) {
        self.day = day
        self.checkIn = checkIn
        self.checkOut = checkOut
        self.requestStatus = requestStatus
        self.timeWorking = timeWorking
        self.timeVacation = timeVacation
        self.vacationType = vacationType
        self.reasonComment = reasonComment
        self.locationComment = locationComment
    }
}
