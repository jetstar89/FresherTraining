//
//  PersonnelViewController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/16/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import SideMenu
import RealmSwift
import Kingfisher
import  HAActionSheet

class PersonnelViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var personnelTableView: UITableView!
    @IBOutlet weak var filterDerpartmentButton: UIButton!
    @IBOutlet weak var searchImageView: UIImageView!
    
    // MARK: - Variable
    var staffs: Results<Staff>?
    let realmManager = RealmDatabaseManager.shared
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        personnelTableView.register(UINib(nibName: "PersonnelTableViewCell",
                                          bundle: nil),
                                    forCellReuseIdentifier: "cell")
        //createData()
        getData()
        //personnelTableView.reloadData()
        setUpNavigationBar(title: "Nhân sự",
                           leftBarButton: UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"),
                                                          style: .done,
                                                          target: self,
                                                          action: #selector(
                                                            onShowLeftMenu(_:))),
                           rightBarButton: UIBarButtonItem(image: #imageLiteral(resourceName: "iconAdd"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(
                                                            onAddStaff(_sender:))))
        searchTextField.layer.cornerRadius = 18
        let paddingView = UIView(
            frame: CGRect(x: 0,
                          y: 0,
                          width: searchImageView.frame.width * 2,
                          height: searchTextField.frame.height))
        searchTextField.leftView = paddingView
        searchTextField.leftViewMode = UITextFieldViewMode.always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Selector
    
    @objc func onAddStaff(_sender: UIBarButtonItem) {
        let staff = Staff.init(name: "Vu",
                               type: 0,
                                avatar: "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                                status: true,
                                department: Derpartment(),
                                birthDay: 0,
                                phone: "0",
                                address: "0",
                                gender: 0)
        realmManager.addObject(obj: staff)
        personnelTableView.reloadData()
    }
    
    // MARK: - IBAction
    @IBAction func onFilterDerpartment(_ sender: UIButton) {
    }
    
    // MARK: - Func

    func getData() {
        staffs = realmManager.getObjects(type: Staff.self)
    }
}

extension PersonnelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = staffs?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PersonnelTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PersonnelTableViewCell else {
            return UITableViewCell()
        }
        if let staff = staffs?[indexPath.row] {
            cell.nameLabel.text = staff.name
            cell.idLabel.text = staff.id.description
            let imageResource = ImageResource(downloadURL: URL(string: staff.avatar)!, cacheKey: staff.avatar)
            cell.avatarImageView.kf.setImage(with: imageResource)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = ["Gọi", "Gửi Email"]
        if (tableView.cellForRow(at: indexPath)?.contentView) != nil {
            let view = HAActionSheet(fromView: self.view, sourceData: data)
            view.cancelButtonTitleColor = UIColor(red: 0/255, green: 122/255, blue: 163/255, alpha: 1)
            view.buttonTitleColor = UIColor(red: 0/255, green: 122/255, blue: 163/255, alpha: 1)
            view.titleFont.withSize(20)
            view.show { (canceled, index) in
                if !canceled {
                    print(data[index!])
                }
                
            }
        }
    }
}

extension PersonnelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                print("delete row at \(indexPath.row)")
            if let staffs = staffs {
                realmManager.deleteObject(obj: staffs[indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
}
