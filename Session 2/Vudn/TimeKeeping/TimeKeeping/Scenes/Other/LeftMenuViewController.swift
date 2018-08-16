//
//  ProfileViewController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/10/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import SideMenu

class LeftMenuViewController: UIViewController {
    
    // MARK: - Outlet    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var logOutButton: UIButton!
    
    // MARK: - Variable
    let tag = "LeftMenuViewController"
    var listOption: [(image: UIImage, name: String)] = []
    var selectItemIndex = 0
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tag + " did load")
        listOption = [
            (#imageLiteral(resourceName: "icChamCong"), "Chấm công"),
            (#imageLiteral(resourceName: "icPhep"), "Nghỉ phép"),
            (#imageLiteral(resourceName: "icChamCongNgoaiCongTy"), "Chấm công ngoài công ty"),
            (#imageLiteral(resourceName: "icNhanSu"), "Nhân sự"), (#imageLiteral(resourceName: "icDuyetRequest"), "Duyệt Request"),
            (#imageLiteral(resourceName: "icDuyetChamCongNgoaiCongTy"), "Duyệt chấm công ngoài công ty"),
            (#imageLiteral(resourceName: "icPassword"), "Đổi mật khẩu")]
        logOutButton.layer.cornerRadius = 4
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil),
                               forCellReuseIdentifier: "cell")
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
        dismiss(animated: true, completion: nil)
    }
    // MARK: - IBAction
    
    @IBAction func onLogOut(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
        (UIApplication.shared.delegate as? AppDelegate)?.setUpRootViewIsLoginViewController()
    }
    // MARK: - Push ViewController
    func pushTimeKeepingViewController() {
        let timeKeepingViewController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
        navigationController?.pushViewController(timeKeepingViewController, animated: true)
    }
    
    func pushPersonnelViewController() {
        let personnelViewController = PersonnelViewController(nibName: "PersonnelViewController", bundle: nil)
        navigationController?.pushViewController(personnelViewController, animated: true)
    }
    
    func pushChangePasswordViewController() {
        let changePasswordViewController = ChangePasswordViewController(nibName: "ChangePasswordViewController", bundle: nil)
        navigationController?.pushViewController(changePasswordViewController, animated: true)
    }
}

// MARK: - Extension

extension LeftMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        cell.iconImageView.image = listOption[indexPath.row].image
        cell.nameLabel.text = listOption[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }
}

extension LeftMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        if let item = tableView.cellForRow(at: indexPath)?.contentView {
            item.setIsOnSelect(true)
        }
        switch indexPath.row {
        case 0:
            selectItemIndex = 0
            pushTimeKeepingViewController()
        case 3:
            pushPersonnelViewController()
        case 6:
            pushChangePasswordViewController()
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView,
                   didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.contentView.backgroundColor = UIColor.frenchBlue
        if let item = tableView.cellForRow(at: indexPath)?.contentView {
            item.setIsOnSelect(false)
        }
    }
}
