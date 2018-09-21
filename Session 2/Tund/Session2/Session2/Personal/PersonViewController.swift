//
//  PersonViewController.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher
import HAActionSheet
import SideMenu

class PersonViewController: UIViewController {
    let dataSheet = ["Gửi Email",
                "Gọi"]
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var personTableView: UITableView!
    var staffs: Results<Staff>?
    let realmManager = RealmManager.shared
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        personTableView.dataSource = self
        personTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: initView
    func initView() {
        //setup navigation
        navigationItem.title = "NHÂN SỰ"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconAdd"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(addStaff))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(onShowLeftMenu(_:)))

        //register TableView
        personTableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // getData
        createData()
        getData()
        personTableView.reloadData()
        updateTitlePerson()
        // setup search TextField
        searchTextField.layer.cornerRadius = 18
        searchTextField.layer.masksToBounds = true
        let padding  = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.searchTextField.frame.height))
        searchTextField.leftView = padding
        searchTextField.leftViewMode = .always
        let onTapViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
        searchTextField.delegate = self
    }
    @objc func onShowLeftMenu(_ sender: MainNavigationController) {
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else { return }
        present(sideMenu, animated: true, completion: nil)
    }
    @objc func addStaff() {
        let firstStaff = Staff()
        firstStaff.name = "Nguyễn Đình Tú"
        firstStaff.userID = "1996"
        firstStaff.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        firstStaff.phone = "01643246989"
        firstStaff.position = "Nhân viên chính thức"
        firstStaff.status = "Đang làm việc"
        realmManager.addObject(obj: firstStaff)
        personTableView.reloadData()
        updateTitlePerson()
    }
    func updateTitlePerson() {
        if let count = staffs?.count {
              titleLabel.text = "Hành chính nhân sự (\(count))"
        }

    }
    @objc func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        searchImageView.isHidden = false
        searchTextField.placeholder = "Tìm kiếm"
    }
    @objc func createData() {
        realmManager.deleteDabase()
        // staff number one
        let firstStaff = Staff()
        firstStaff.name = "Nguyễn Đình Tú"
        firstStaff.userID = "1992"
        firstStaff.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        firstStaff.phone = "01643246989"
        firstStaff.position = "Nhân viên chính thức"
        firstStaff.status = "Đang làm việc"
        //staff number two
        let secondStaff = Staff()
        secondStaff.name = "Nguyễn Tùng lâm"
        secondStaff.userID = "1993"
        secondStaff.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        secondStaff.phone = "0987625124"
        secondStaff.position = "Nhân viên chính thức"
        secondStaff.status = "Đang làm việc"
        //staff number three
        let thirdStaff = Staff()
        thirdStaff.name = "Đặng Xuân Duy"
        thirdStaff.userID = "1994"
        thirdStaff.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        thirdStaff.phone = "0987625124"
        thirdStaff.position = "Nhân viên chính thức"
        thirdStaff.status = "Đang làm việc"
        //stafff number four
        let fourthStaff = Staff()
        fourthStaff.name = "Đinh Ngọc Vũ"
        fourthStaff.userID = "1995"
        fourthStaff.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        fourthStaff.phone = "0987625124"
        fourthStaff.position = "Nhân viên chính thức"
        fourthStaff.status = "Đang làm việc"
        realmManager.addObject(obj: firstStaff)
        realmManager.addObject(obj: secondStaff)
        realmManager.addObject(obj: thirdStaff)
        realmManager.addObject(obj: fourthStaff)
        // get data from realm
    }
    func getData() {
//        do {
//            let realm = try Realm()
//            staffs = realm.objects(Staff.self)
//        } catch let error as NSError {
//            print(error.description)
//            print("Cant get data")
//        }
        staffs = realmManager.getObjects(Staff.self)

    }
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }

}
extension PersonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("sadfsa")
    }
}
extension PersonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = staffs?.count else {
            return 0
        }
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idenfier = "cell"
        guard let cell: PersonTableViewCell =
            personTableView.dequeueReusableCell(withIdentifier: idenfier, for: indexPath)
                as? PersonTableViewCell else {
            return UITableViewCell()
        }
        if let staffs = staffs {
            let urlImage = URL(string: staffs[indexPath.row].avatar)
            cell.avatarImageView.kf.setImage(with: urlImage)
            cell.idLabel.text = staffs[indexPath.row].userID.description
            cell.nameLabel.text = staffs[indexPath.row].name
            cell.phoneLabel.text = staffs[indexPath.row].phone
            cell.positionLabel.text = staffs[indexPath.row].position
            cell.statusButton.setTitle(staffs[indexPath.row].status, for: .normal)
        }
        return cell
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let item = staffs?[indexPath.row] {
                realmManager.deleteObject(obj: item)
                updateTitlePerson()
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
extension PersonViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == searchTextField {
            searchImageView.isHidden = true
            searchTextField.placeholder = nil
        } else {
            //
        }
    }
}
