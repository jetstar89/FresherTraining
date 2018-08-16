//
//  PersonnelViewController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/16/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import RealmSwift

class PersonnelViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var personnelTableView: UITableView!
    @IBOutlet weak var filterDerpartmentButton: UIButton!
    
    var staffs: Results<Staff>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personnelTableView.register(UINib(nibName: "PersonnelTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        createData()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"), style: .done, target: self, action: #selector())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchTextField.layer.cornerRadius = 18
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
        
        let staffOne = Staff()
        staffOne.name = "Vu"
        staffOne.department = ios
        staffOne.phone = "0969889533"
        staffOne.status = true
        staffOne.avatar = "http://www.standuptragedy.co.uk/CMS/wp-content/uploads/2016/03/2-flower-wallpaper.jpg"
        staffOne.type = 0
        
        let staffTwo = Staff()
        staffTwo.name = "Duy"
        staffTwo.department = ios
        staffTwo.phone = "123456"
        staffTwo.status = true
        staffTwo.avatar = "http://www.standuptragedy.co.uk/CMS/wp-content/uploads/2016/03/2-flower-wallpaper.jpg"
        staffTwo.type = 0
        
        let staffThree = Staff()
        staffThree.name = "Tu"
        staffThree.department = ios
        staffThree.phone = "123654"
        staffThree.status = true
        staffThree.avatar = "http://www.standuptragedy.co.uk/CMS/wp-content/uploads/2016/03/2-flower-wallpaper.jpg"
        staffThree.type = 0
        
        let staffFour = Staff()
        staffFour.name = "Lam"
        staffFour.department = ios
        staffFour.phone = "321456"
        staffFour.status = true
        staffFour.avatar = "http://www.standuptragedy.co.uk/CMS/wp-content/uploads/2016/03/2-flower-wallpaper.jpg"
        staffFour.type = 0
        
        let staffFive = Staff()
        staffFive.name = "Thanh"
        staffFive.department = ios
        staffFive.phone = "321654"
        staffFive.status = true
        staffFive.avatar = "http://www.standuptragedy.co.uk/CMS/wp-content/uploads/2016/03/2-flower-wallpaper.jpg"
        staffFive.type = 0
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(ios)
                realm.add(staffOne)
                realm.add([staffOne, staffTwo, staffThree, staffFour, staffFive])
            }
        } catch let error as NSError {
            print("\(error.description)")
        }
    }
    
    func getData() {
        do {
            let realm = try Realm()
            staffs = realm.objects(Staff.self)
        } catch let error as NSError {
            print("\(error.description)")
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
        print("number of row = 5")
        guard let staffs = staffs else {
            return 0
        }
        return staffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PersonnelTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PersonnelTableViewCell else {
            return UITableViewCell()
        }
        if let staffs = staffs {
            cell.nameLabel.text = staffs[indexPath.row].name
        } else {
            // no staff
        }
        return cell
    }
}

extension PersonnelViewController: UITableViewDelegate {
    
}

public class Staff: Object {
    @objc dynamic var name = ""
    @objc dynamic var id = 0
    @objc dynamic var phone = ""
    @objc dynamic var type = 0
    @objc dynamic var avatar = ""
    @objc dynamic var status = false
    @objc dynamic var department: Derpartment?
}

public class Derpartment: Object {
    @objc dynamic var name = ""
    @objc dynamic var id = 0
    let staffs = List<Staff>()
}
