//
//  PersonViewController.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var listPerson: [Person] = []
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var personTableView: UITableView!
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        personTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    // MARK: initView
    func initView() {
        // navigation control
        navigationItem.title = "NHÂN SỰ"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(onBack))
        // add listPerson
        let person = Person(idUser: "00156",
                            avatar: #imageLiteral(resourceName: "jangmi5"),
                            name: "Nguyen Dinh Tu",
                            phone: "01643246989",
                            position: "Nhan vien chinh thuc",
                            status: "Dang lam")
        listPerson.append(person)
        listPerson.append(person)
        listPerson.append(person)
        listPerson.append(person)
        listPerson.append(person)
        listPerson.append(person)
        listPerson.append(person)
        listPerson.append(person)
        listPerson.append(person)
        //register TableView
        personTableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        //controlview
        searchTextField.layer.cornerRadius = 18
        searchTextField.layer.masksToBounds = true
        titleLabel.text = "Hành chính nhân sự (\(listPerson.count))"
        let padding  = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.searchTextField.frame.height))
        searchTextField.leftView = padding
        searchTextField.leftViewMode = .always
    }
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }
}
extension PersonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
extension PersonViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return listPerson.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idenfier = "cell"
        guard let cell: PersonTableViewCell =
            personTableView.dequeueReusableCell(withIdentifier: idenfier, for: indexPath)
                as? PersonTableViewCell else {
            return UITableViewCell()
        }
        cell.avatarImageView.image = listPerson[indexPath.row].avatar
        cell.idLabel.text = listPerson[indexPath.row].idUser
        cell.nameLabel.text = listPerson[indexPath.row].name
        cell.phoneLabel.text = listPerson[indexPath.row].phone
        cell.positionLabel.text = listPerson[indexPath.row].position
        cell.statusButton.setTitle(listPerson[indexPath.row].status, for: .normal)
        return cell
    }
}
