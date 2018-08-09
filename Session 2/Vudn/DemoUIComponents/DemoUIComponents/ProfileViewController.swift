//
//  ProfileController.swift
//  DemoUIComponents
//
//  Created by Đinh Ngọc Vũ on 8/6/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let tag = "ProfileViewController"
    var listOption: [(image: UIImage, name: String)] = []
    // MARK: - Outlet

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var logOutButton: UIButton!
    

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tag + " did load")
        listOption = [(#imageLiteral(resourceName: "icChamCong"), "Chấm công"), (#imageLiteral(resourceName: "icPhep"), "Nghỉ phép"), (#imageLiteral(resourceName: "icChamCongNgoaiCongTy"), "Chấm công ngoài công ty") , (#imageLiteral(resourceName: "icNhanSu"), "Nhân sự"), (#imageLiteral(resourceName: "icDuyetRequest"), "Duyệt Request"), (#imageLiteral(resourceName: "icDuyetChamCongNgoaiCongTy"), "Duyệt chấm công ngoài công ty"), (#imageLiteral(resourceName: "icPassword"), "Đổi mật khẩu")]
        logOutButton.layer.cornerRadius = 4
        //menuTableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        menuTableView.register(UINib(nibName: "LogOutTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "logout")
        print(tag + " will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(tag + " did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(tag + " will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(tag + " did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print(tag + " deinit")
    }
    
    // MARK: - IBAction
    
    @IBAction func onLogOut(_ sender: UIButton) {
        (UIApplication.shared.delegate as? AppDelegate)?.setUpRootViewIsLoginViewController()
    }
    
}

// MARK: - Extension

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return listOption.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let indentifier = "cell"
            let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! MenuTableViewCell
            
            cell.iconImageView.image = listOption[indexPath.row].image
            cell.nameLabel.text = listOption[indexPath.row].name
            return cell
        } else {
            let indentifier = "logout"
            let button: LogOutTableViewCell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! LogOutTableViewCell
            
            return button
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = tableView.cellForRow(at: indexPath)?.contentView {
            item.setIsOnSelect(true)
        }
        
        switch indexPath.row {
        case 0:
            let timeKeepingViewController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
            navigationController?.pushViewController(timeKeepingViewController, animated: true)
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.contentView.backgroundColor = UIColor.frenchBlue
        if let item = tableView.cellForRow(at: indexPath)?.contentView {
            item.setIsOnSelect(false)
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    
}
