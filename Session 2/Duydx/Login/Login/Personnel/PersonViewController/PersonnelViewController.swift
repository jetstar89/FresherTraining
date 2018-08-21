//
//  PersonnelViewController.swift
//  Login
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu
import RealmSwift
import Kingfisher
import HAActionSheet
class PersonnelViewController: UIViewController {
    @IBOutlet weak var personTableView: UITableView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    let realmManager = RealmManager.shared
    var idPerson: Int = 0
    var listPerson: Results<Person>?
    let data = ["Gọi", "Gửi Email"]
    // MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataDatabase()
        initView()
    }
    func getDataDatabase() {
        guard let listPerson = realmManager.getAllPerson() else {
            return
        }
        self.listPerson = listPerson
    }
    // MARK: initView
    func initView() {
        idPerson = UserDefaults.standard.integer(forKey: "idPerson")
        tabBarController?.tabBar.isHidden = true
        positionLabel.text = "Developer"
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "NHÂN SỰ"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor =
            UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconMenu"),
                                                           style: .plain, target: self, action: #selector(selectedMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconAdd"),
                                                           style: .plain, target: self, action: #selector(addPerson))
        personTableView.dataSource = self
        personTableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        searchTextField.layer.cornerRadius = 15.0
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.white.cgColor
        searchTextField.layer.backgroundColor = UIColor.white.cgColor
        let searchImage = UIImageView()
        let image = UIImage(named: "search")
        searchImage.image = image
        searchImage.frame = CGRect(x: 0, y: 0, width: 14, height: 14)
        searchTextField.leftViewMode = .always
        searchTextField.leftView = searchImage
    }
    @objc func addPerson() {
        let person = Person()
        idPerson = UserDefaults.standard.integer(forKey: "idPerson")
        idPerson += 1
        person.namePerson = "Đặng Xuân Duy"
        person.idPerson = idPerson.description
        person.phonePerson = "0967505425"
        person.positionPerson = "Developer"
        if idPerson % 2 == 0 {
            person.isStatus = true
            person.imagePerson = "https://4.bp.blogspot.com/-O7MeRoCAXNI/"
                + "VtOyBZBwHQI/AAAAAAABQtw/D4EiKq73_Lo/s1600/gai-dep-1.jpg"
        } else {
            person.isStatus = false
            person.imagePerson = "https://baomoi-photo-1-td.zadn.vn/w1000_r1/17/12/15/23/24302239/1_313006.jpg"
        }
        realmManager.addPerson(person)
        listPerson = realmManager.getAllPerson()
        personTableView.reloadData()
        UserDefaults.standard.set(idPerson, forKey: "idPerson")
    }
    @objc func selectedMenu() {
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else {
            return
        }
        present(sideMenu, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
// MARK: extension UITableViewDataSource
extension PersonnelViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = listPerson?.count else {
            return 0
        }
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PersonTableViewCell =
            personTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as? PersonTableViewCell else {
            return UITableViewCell()
        }
        if let listPerson = listPerson {
//            cell.logoImage.image = UIImage(named: listPerson[indexPath.row].imagePerson)
            let url = URL(string: listPerson[indexPath.row].imagePerson)
            cell.logoImage.kf.setImage(with: url)
            cell.nameLabel.text = listPerson[indexPath.row].namePerson
            cell.idLabel.text = "ID: " + listPerson[indexPath.row].idPerson
            cell.phoneLabel.text = listPerson[indexPath.row].phonePerson
            cell.positionLabel.text = listPerson[indexPath.row].positionPerson
            if listPerson[indexPath.row].isStatus {
                cell.statusLabel.text = "Đang làm"
                cell.statusLabel.backgroundColor = UIColor(red: 61/255, green: 182/255, blue: 96/255, alpha: 1)
            } else {
                cell.statusLabel.text = "Đã nghỉ"
                cell.statusLabel.backgroundColor = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
            }
        }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let person = listPerson?[indexPath.row] {
                realmManager.deletePerson(person)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
// MARK: extension UITableViewDelegate
extension PersonnelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = personTableView.cellForRow(at: indexPath)?.contentView {
            item.isSelected(true, "PersonnelViewController")
            let view = HAActionSheet(fromView: self.view, sourceData: data)
            view.cancelButtonTitleColor = UIColor(red: 0/255, green: 122/255, blue: 163/255, alpha: 1)
            view.buttonTitleColor = UIColor(red: 0/255, green: 122/255, blue: 163/255, alpha: 1)
            view.titleFont.withSize(20)
            view.show { (canceled, index) in
                if !canceled {
                    print(self.data[index!])
                }
                item.isSelected(false, "PersonnelViewController")
            }
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let item = personTableView.cellForRow(at: indexPath)?.contentView {
            item.isSelected(false, "PersonnelViewController")
        }
    }
}
