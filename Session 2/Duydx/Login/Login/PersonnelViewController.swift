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
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet var choosePositionButton: [UIButton]!
    @IBOutlet weak var searchTextField: UITextField!
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popViewController(animated: true)
    }
    //MARK: initView
    func initView() {
        positionLabel.text = "Developer"
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "NHÂN SỰ"
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
        searchTextField.layer.cornerRadius = 15.0
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.white.cgColor
        searchTextField.layer.backgroundColor = UIColor.white.cgColor
        let searchImage = UIImageView();
        let image = UIImage(named: "search");
        searchImage.image = image;
        searchImage.frame = CGRect(x: 0, y: 0, width: 14, height: 14)
        searchTextField.leftViewMode = .always
        searchTextField.leftView = searchImage;
        
    }
    
    @objc func selectedMenu() {
        print("Chọn chức năng menu")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showPosition() {
        
        choosePositionButton.forEach { (buttonPosition) in
            UIView.animate(withDuration: 0.3, animations: {
                buttonPosition.isHidden = !buttonPosition.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    //MARK: IBAction
    @IBAction func choosePosition(_ sender: UIButton) {
        showPosition()
    }
    @IBAction func onTapChoosePostition(_ sender: UIButton) {
        if let title = sender.currentTitle {
            switch title {
            case "Developer":
                positionLabel.text = "Developer"
                showPosition()
            case "Hành Chính nhân sự":
                positionLabel.text = "Hành Chính nhân sự"
                showPosition()
            case "Kế toán":
                positionLabel.text = "Kế toán"
                showPosition()
            case "Tester":
                positionLabel.text = "Tester"
                showPosition()
            default:
                break
            }
        }
    }
    
}
//MARK: extension UITableViewDataSource
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
        cell.selectionStyle = .none
        return cell
    }
}
//MARK: extension UITableViewDelegate
extension PersonnelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = personTableView.cellForRow(at: indexPath)?.contentView {
            item.isSelected(true, "PersonnelViewController")
        }
        print(listPerson[indexPath.row].namePersion)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let item = personTableView.cellForRow(at: indexPath)?.contentView {
            item.isSelected(false, "PersonnelViewController")
        }
    }
}


