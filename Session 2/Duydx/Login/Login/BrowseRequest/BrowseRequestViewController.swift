//
//  BrowseRequestViewController.swift
//  Login
//
//  Created by admin on 8/14/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class BrowseRequestViewController: UIViewController {

    @IBOutlet weak var browseRequestTableView: UITableView!
    var dataBrowseRequest = [Vacation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    func initView() {
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "DUYỆT REQUEST"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconMenu"), style: .plain, target: self, action: #selector(selectedMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconAdd"), style: .plain, target: self, action: #selector(addRequest))
        browseRequestTableView.register(UINib(nibName: "BrowseRequestTableViewCell", bundle: nil), forCellReuseIdentifier: "BrowseRequestTableViewCell")
        dataBrowseRequest = [
                            Vacation("Xin nghỉ cưới", "1/03/2018 - 08:00 SA  đến 02/03/2018 - 05:30 CH", "Duydx", "01/03/2018 - 10:23 SA", "NCP", ""),
                            Vacation("Xin nghỉ cưới", "1/03/2018 - 08:00 SA  đến 05/03/2018 - 05:30 CH", "NamNv", "01/03/2018 - 11:23 SA", "NKP", ""),
                            Vacation("Xin nghỉ cưới", "1/03/2018 - 08:00 SA  đến 10/03/2018 - 05:30 CH", "Duydx", "01/03/2018 - 10:40 SA", "pending", ""),
                            Vacation("Xin nghỉ đi du lịch", "1/03/2018 - 08:00 SA  đến 04/03/2018 - 05:30 CH", "Duydx", "01/03/2018 - 10:23 SA", "reject", "Lý do không hợp lý. Dự án đang trong giai đoạn nghiệm thu không thể nghỉ dài ngày. "),
                            Vacation("Xin nghỉ cưới", "1/03/2018 - 08:00 SA  đến 02/03/2018 - 05:30 CH", "Duydx", "01/03/2018 - 10:23 SA", "NCP", ""),
                            Vacation("Xin nghỉ đi du lịch", "1/03/2018 - 08:00 SA  đến 04/03/2018 - 05:30 CH", "Duydx", "01/03/2018 - 10:23 SA", "reject", "Lý do không hợp lý. Dự án đang trong giai đoạn nghiệm thu không thể nghỉ dài ngày. "),
                            Vacation("Xin nghỉ cưới", "1/03/2018 - 08:00 SA  đến 02/03/2018 - 05:30 CH", "Duydx", "01/03/2018 - 10:23 SA", "NCP", ""),
                            Vacation("Xin nghỉ cưới", "1/03/2018 - 08:00 SA  đến 05/03/2018 - 05:30 CH", "NamNv", "01/03/2018 - 11:23 SA", "NKP", "")
                            ]
    }
    @objc func addRequest() {
        print("Add Request")
    }
    @objc func selectedMenu() {
        navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
extension BrowseRequestViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBrowseRequest.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BrowseRequestTableViewCell", for: indexPath) as? BrowseRequestTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = dataBrowseRequest[indexPath.row].title
        cell.timeVacationLabel.text = dataBrowseRequest[indexPath.row].timeVacation
        cell.timeRequestLabel.text = dataBrowseRequest[indexPath.row].timeRequest
        cell.namePersonLabel.text = dataBrowseRequest[indexPath.row].namePerson
        let status: String = dataBrowseRequest[indexPath.row].status
        if status.isEqual("NCP") {
            cell.statusImage.image = UIImage(named: "icPhepCoLuong")
            cell.noteLabel.isHidden = true
        } else if status.isEqual("NKP") {
            cell.statusImage.image = UIImage(named: "icPhepKoLuong")
            cell.noteLabel.isHidden = true
        } else if status.isEqual("pending") {
            cell.statusImage.image = UIImage(named: "icPhepPendingRequest")
            cell.noteLabel.isHidden = true
        } else if status.isEqual("reject") {
            cell.statusImage.image = UIImage(named: "icRejectRequest")
            cell.noteLabel.isHidden = false
            cell.noteLabel.text = dataBrowseRequest[indexPath.row].note
        }
        return cell
    }
}
extension BrowseRequestTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
