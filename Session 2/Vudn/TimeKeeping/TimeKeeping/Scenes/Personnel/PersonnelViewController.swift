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

class PersonnelViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var personnelTableView: UITableView!
    @IBOutlet weak var filterDerpartmentButton: UIButton!
    @IBOutlet weak var searchImageView: UIImageView!
    
    // MARK: - Variable
    var staffs = [Staff]()
    let realmManager = RealmManager.shared
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        personnelTableView.register(UINib(nibName: "PersonnelTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        //createData()
        getData()
        personnelTableView.reloadData()
        setUpNavigationBar(title: "Nhân sự", leftBarButton: UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"), style: .done, target: self, action: #selector(onShowLeftMenu(_:))), rightBarButton: nil)
        searchTextField.layer.cornerRadius = 18
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: searchImageView.frame.width * 2, height: searchTextField.frame.height))
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
    
    // MARK: - IBAction
    @IBAction func onFilterDerpartment(_ sender: UIButton) {
    }
    
    // MARK: - Func
    func createData() {
        let ios = Derpartment()
        ios.name = "iOS department"
        realmManager.addObject(obj: ios)
        
        let staffOne = Staff()
        staffOne.name = "Vu"
        staffOne.id = 1
        staffOne.birthday = 1
        staffOne.address = "HN"
        staffOne.gender = Gender.male.rawValue
        staffOne.department = ios
        staffOne.phone = "0969889533"
        staffOne.status = true
        staffOne.avatar = "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"
        staffOne.type = 0
        realmManager.addObject(obj: staffOne)
        
        let staffTwo = Staff()
        staffTwo.id = 2
        staffTwo.name = "Duy"
        staffTwo.department = ios
        staffTwo.phone = "123456"
        staffTwo.status = true
        staffTwo.avatar = "https://images.pexels.com/photos/10462/pexels-photo-10462.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"
        staffTwo.type = 0
        realmManager.addObject(obj: staffTwo)

        let staffThree = Staff()
        staffThree.id = 3
        staffThree.name = "Tu"
        staffThree.department = ios
        staffThree.phone = "123654"
        staffThree.status = true
        staffThree.avatar = "https://images.pexels.com/photos/54319/cranesbill-blossom-bloom-blue-54319.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"
        staffThree.type = 0
        realmManager.addObject(obj: staffThree)

        let staffFour = Staff()
        staffFour.name = "Lam"
        staffFour.id = 4
        staffFour.department = ios
        staffFour.phone = "321456"
        staffFour.status = true
        staffFour.avatar = "https://images.pexels.com/photos/34522/grevillea-flower-australian-native.jpg?auto=compress&cs=tinysrgb&h=750&w=1260"
        staffFour.type = 0
        realmManager.addObject(obj: staffFour)

        let staffFive = Staff()
        staffFive.name = "Thanh"
        staffFive.id = 5
        staffFive.department = ios
        staffFive.phone = "321654"
        staffFive.status = true
        staffFive.avatar = "https://images.pexels.com/photos/62317/lily-blossom-bloom-flower-62317.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"
        staffFive.type = 0
        realmManager.addObject(obj: staffFive)
        //realmManager.addObjects(objs: [staffOne, staffTwo, staffThree, staffFour, staffFive])
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
    
    func addStaff(_ staff: Staff) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(staff)
            }
        } catch let error as NSError {
            print("\(error.description)")
        }
    }
}

extension PersonnelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("staffs = \(staffs.count)")
        return staffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PersonnelTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PersonnelTableViewCell else {
            return UITableViewCell()
        }
        let staff = staffs[indexPath.row]
        cell.nameLabel.text = staff.name
        let imageResource = ImageResource(downloadURL: URL(string: staff.avatar)!, cacheKey: staff.avatar)
        cell.avatarImageView.kf.setImage(with: imageResource)
        return cell
    }
}

extension PersonnelViewController: UITableViewDelegate {
    
}
