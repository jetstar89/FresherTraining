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
    var staffs: Results<Staff>?
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
        // get data
        do {
            let realm = try Realm()
            try realm.write {
                staffs = realm.objects(Staff.self)
            }
        } catch let error as NSError {
            print("\(error.description)")
        }
        // navigation control
        navigationItem.title = "NHÂN SỰ"
        // add listPerson

        //register TableView
        personTableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        //controlview
        if let count = staffs?.count {
            titleLabel.text = "Hành chính nhân sự (\(count))"
        } else {
            //
        }
        createData()
    }
    @objc func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        searchImageView.isHidden = false
        searchTextField.placeholder = "Tìm kiếm"
    }
    func createData() {
        // staff number one
        let staffOne = Staff()
        staffOne.userID = "00156"
        staffOne.name = "Nguyễn Đình Tú"
        staffOne.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        staffOne.phone = "01643246989"
        staffOne.position = "Nhân viên chính thức"
        staffOne.status = "Đang làm việc"
        //staff number two
        let staffTwo = Staff()
        staffTwo.userID = "00156"
        staffTwo.name = "Nguyễn Tùng lâm"
        staffTwo.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        staffTwo.phone = "0987625124"
        staffTwo.position = "Nhân viên chính thức"
        staffTwo.status = "Đang làm việc"
        //stafff number three
        let staffThree = Staff()
        staffThree.userID = "00156"
        staffThree.name = "Đặng Xuân Duy"
        staffThree.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        staffThree.phone = "0987625124"
        staffThree.position = "Nhân viên chính thức"
        staffThree.status = "Đang làm việc"
        //stafff number four
        let staffFour = Staff()
        staffFour.userID = "00156"
        staffFour.name = "Đinh Ngọc Vũ"
        staffFour.avatar = "https://i.ytimg.com/vi/xAY4_lF822w/maxresdefault.jpg"
        staffFour.phone = "0987625124"
        staffFour.position = "Nhân viên chính thức"
        staffFour.status = "Đang làm việc"
        do {
            let realm = try Realm()
            try realm.write {
                let staff = realm.objects(Staff.self)
                realm.delete(staff)
                realm.add([staffOne, staffTwo, staffThree, staffFour])
                staffs = realm.objects(Staff.self)
            }
        } catch let error as NSError {
            print("\(error.description)")
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
            cell.idLabel.text = staffs[indexPath.row].userID
            cell.nameLabel.text = staffs[indexPath.row].name
            cell.phoneLabel.text = staffs[indexPath.row].phone
            cell.positionLabel.text = staffs[indexPath.row].position
            cell.statusButton.setTitle(staffs[indexPath.row].status, for: .normal)
        } else {
            // empty data
        }
        return cell
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
