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
    var listPerson: Results<Person>?
    let data = ["Gọi", "Gửi Email"]
    // MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    // MARK: initView
    func initView() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
                listPerson = realm.objects(Person.self)
            }
        } catch let error as NSError {
            print("\(error)")
        }
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
        person.namePerson = "Đặng Xuân Duy"
        person.idPerson = "ID: 00156"
        person.phonePerson = "0967505425"
        person.positionPerson = "Developer"
        person.isStatus = true
        person.imagePerson = "https://3.bp.blogspot.com/--BFeUQxXAgs/WhuL35YtNlI/AAAAAAAADbY/opwlU69xFekZS3po0FwYd3eedrcy3rLsgCLcBGAs/s1600/anh-gai-xinh%2B%25289%2529.jpg"
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(person)
                listPerson = realm.objects(Person.self)
                personTableView.reloadData()
            }
        } catch let error as NSError {
            print("\(error)")
        }
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
            cell.idLabel.text = listPerson[indexPath.row].idPerson
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
            if let item = listPerson?[indexPath.row] {
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.delete(item)
                    }
                } catch let error as NSError {
                    print("\(error)")
                }
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
