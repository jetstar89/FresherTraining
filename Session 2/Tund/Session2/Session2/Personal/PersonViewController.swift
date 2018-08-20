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

class PersonViewController: UIViewController {
    let dataSheet = ["Gửi Email",
                "Gọi"]
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var personTableView: UITableView!
    var staffs = [Staff]()
    let realmManager = RealmManager.shared
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.deleteAll()
//            }
//        } catch let error as NSError {
//            print(error.description)
//        }
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
    func updateTitlePerson() {
        let count = staffs.count
        titleLabel.text = "Hành chính nhân sự (\(count))"
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
        firstStaff.userID = "00156"
        firstStaff.name = "Nguyễn Đình Tú"
        firstStaff.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        firstStaff.phone = "01643246989"
        firstStaff.position = "Nhân viên chính thức"
        firstStaff.status = "Đang làm việc"
        //staff number two
        let secondStaff = Staff()
        secondStaff.userID = "00157"
        secondStaff.name = "Nguyễn Tùng lâm"
        secondStaff.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        secondStaff.phone = "0987625124"
        secondStaff.position = "Nhân viên chính thức"
        secondStaff.status = "Đang làm việc"
        //staff number three
        let thirdStaff = Staff()
        thirdStaff.userID = "00158"
        thirdStaff.name = "Đặng Xuân Duy"
        thirdStaff.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        thirdStaff.phone = "0987625124"
        thirdStaff.position = "Nhân viên chính thức"
        thirdStaff.status = "Đang làm việc"
        //stafff number four
        let fourthStaff = Staff()
        fourthStaff.userID = "00159"
        fourthStaff.name = "Đinh Ngọc Vũ"
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
        if let objs = realmManager.getObjects(type: Staff.self) {
            for element in objs {
                if let staff = element as? Staff {
                    staffs.append(staff)
                }
            }
        }
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
       return staffs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idenfier = "cell"
        guard let cell: PersonTableViewCell =
            personTableView.dequeueReusableCell(withIdentifier: idenfier, for: indexPath)
                as? PersonTableViewCell else {
            return UITableViewCell()
        }
            let urlImage = URL(string: staffs[indexPath.row].avatar)
            cell.avatarImageView.kf.setImage(with: urlImage)
            cell.idLabel.text = staffs[indexPath.row].userID
            cell.nameLabel.text = staffs[indexPath.row].name
            cell.phoneLabel.text = staffs[indexPath.row].phone
            cell.positionLabel.text = staffs[indexPath.row].position
            cell.statusButton.setTitle(staffs[indexPath.row].status, for: .normal)
        return cell
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            let item = staffs[indexPath.row]
//            realmManager.deleteObject(obj: item)
//            updateTitlePerson()
//            personTableView.reloadData()
//            tableView.deleteRows(at: [indexPath], with: .automatic)
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
