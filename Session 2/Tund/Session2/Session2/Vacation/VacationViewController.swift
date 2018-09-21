//
//  VacationViewController.swift
//  Session2
//
//  Created by admin on 8/16/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu

class VacationViewController: UIViewController {
    @IBOutlet weak var noMoneyLabel: UILabel!
    @IBOutlet weak var dayVacationLabel: UILabel!
    @IBOutlet weak var vacationTableView: UITableView!
    var listVacation: [Vacation] = []
    let service = QueryService()
    var arrPosts = [Posts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        let services = AllDataServices()
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        services.getDataResults() { (result) in
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            switch result {
//            case .success(let posts):
//                for item in posts {
//                    print(item.body)
//                }
//            case .failure(let error):
//                print("Fail get data")
//                print(error)
//            }
//        }
//    
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        service.getDataResults(completion: {(posts, error) in
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            if let posts = posts {
//                self.arrPosts = posts
//                for item in self.arrPosts {
//                    print(item.id)
//                }
//                } else {
//                    print(error)
//                }
//        })
        vacationTableView.delegate = self
        vacationTableView.dataSource = self
        initData()
        navigationItem.title = "NGHỈ PHÉP"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(onShowLeftMenu(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconAdd"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(onAdd))
        vacationTableView.register(UINib(nibName: "VacationTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: init and functions
    @objc func onShowLeftMenu(_ sender: MainNavigationController) {
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else { return }
        present(sideMenu, animated: true, completion: nil)
    }
    @objc func onAdd() {
        print("add")
    }
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }
    // initData
    func initData() {
        listVacation = [Vacation(name: "Tund",
                                 reason: "Xin nghỉ ốm",
                                 timeDuration: "1/03/2018 - 08:00 SA  đến 02/03/2018 - 05:30 CH",
                                 timeBegin: "1/03/2018 - 08:00 SA",
                                 resultNote: "",
                                 result: "Phép không lương"),
                        Vacation(name: "Tund",
                                 reason: "Xin nghỉ ăn cưới",
                                 timeDuration: "1/03/2018 - 08:00 SA  đến 02/03/2018 - 05:30 CH",
                                 timeBegin: "1/03/2018 - 08:00 SA", resultNote: "", result: "Đang chờ duyệt"),
                        Vacation(name: "Tund",
                                 reason: "Xin nghỉ đi du lịch",
                                 timeDuration: "1/03/2018 - 08:00 SA  đến 02/03/2018 - 05:30 CH",
                                 timeBegin: "1/03/2018 - 08:00 SA",
                                 resultNote: "Lý do không hợp lý. Dự án đang trong giai đoạn nghiệm thu không thể nghỉ dài ngày. ",
                                 result: "Không đồng ý"),
                        Vacation(name: "Tund",
                                 reason: "Xin nghỉ đi khám bệnh",
                                 timeDuration: "1/03/2018 - 08:00 SA  đến 02/03/2018 - 05:30 CH",
                                 timeBegin: "01/03/2018 - 10:23 SA", resultNote: "", result: "Phép có lương")]
    }
}
extension VacationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
extension VacationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVacation.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idenfier = "cell"
        guard let cell: VacationTableViewCell =
            vacationTableView.dequeueReusableCell(withIdentifier: idenfier, for: indexPath)
                as? VacationTableViewCell else {
                    return UITableViewCell()
        }
        cell.initView(name: listVacation[indexPath.row].name,
                      reason: listVacation[indexPath.row].reason,
                      timeDuration: listVacation[indexPath.row].timeDuration,
                      timeBegin: listVacation[indexPath.row].timeBegin,
                      resultNote: listVacation[indexPath.row].resultNote,
                      result: listVacation[indexPath.row].result)
        return cell
    }
}
