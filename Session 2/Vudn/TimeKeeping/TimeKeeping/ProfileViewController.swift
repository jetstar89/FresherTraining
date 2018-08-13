//
//  ProfileViewController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/10/18.
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
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        
        menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
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
    
    // MARK: - Push ViewController
    
    func pushTimeKeepingViewController() {
        let timeKeepingViewController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
        navigationController?.pushViewController(timeKeepingViewController, animated: true)
    }
    
    func pushChangePasswordViewController() {
        let changePasswordViewController = ChangePasswordViewController(nibName: "ChangePasswordViewController", bundle: nil)
        navigationController?.pushViewController(changePasswordViewController, animated: true)
    }
}

// MARK: - Extension

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "cell"
        let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! MenuTableViewCell
        cell.iconImageView.image = listOption[indexPath.row].image
        cell.nameLabel.text = listOption[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }

}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = tableView.cellForRow(at: indexPath)?.contentView {
            item.setIsOnSelect(true)
        }
        
        switch indexPath.row {
        case 0:
            pushTimeKeepingViewController()
            break
            
        case 6:
            print("change password")
            pushChangePasswordViewController()
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
