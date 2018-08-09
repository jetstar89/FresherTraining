//
//  PersonnelViewController.swift
//  Login
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class PersonnelViewController: UIViewController {
    var listPerson = [Person]()
    @IBOutlet weak var personTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    func initView() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Person"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconMenu"), style: .plain, target: self, action: #selector(selectedMenu))
        personTableView.dataSource = self
        personTableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        listPerson = [Person("Đặng Xuân Duy", "ID: 00156", "0967505425", "Developer", true, "gaixinh"),
                      Person("Đinh Ngọc Vũ", "ID: 00157", "0967505425", "Developer", true, "gaixinha"),
                      Person("Văn Tiến Thành", "ID: 00158", "096745345", "Developer", false, "profileImage"),
                      Person("Nguyễn Đình Tú", "ID: 00156", "0967505425", "Developer", true, "profileImage"),
                      Person("Nguyễn Văn Lâm", "ID: 00156", "0967505425", "Developer", false, "gaixinha"),
                      Person("Đặng Xuân Duy", "ID: 00156", "0967505425", "Developer", true, "gaixinh")
        ]
    }
    @objc func selectedMenu() {
        print("Chọn chức năng menu")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension PersonnelViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPerson.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonTableViewCell = personTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonTableViewCell
        cell.logoImage.image = UIImage(named: listPerson[indexPath.row].imagePerson)
        cell.nameLabel.text = listPerson[indexPath.row].namePersion
        cell.idLabel.text = listPerson[indexPath.row].idPersion
        cell.phoneLabel.text = listPerson[indexPath.row].phonePerson
        cell.positionLabel.text = listPerson[indexPath.row].positionPerson
        if listPerson[indexPath.row].isStatus {
            cell.statusLabel.text = "Đang làm"
            cell.statusLabel.backgroundColor = UIColor(red: 61/255, green: 182/255, blue: 96/255, alpha: 1)
        } else {
            cell.statusLabel.text = "Đã nghỉ"
            cell.statusLabel.backgroundColor = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
        }
        return cell
    }
}
extension PersonnelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = personTableView.cellForRow(at: indexPath)?.contentView {
            item.isSelected(true, "PersonnelViewController")
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let item = personTableView.cellForRow(at: indexPath)?.contentView {
            item.isSelected(false, "PersonnelViewController")
        }
    }
}

