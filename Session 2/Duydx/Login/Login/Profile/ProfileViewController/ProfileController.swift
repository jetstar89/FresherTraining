//
//  ProfileController.swift
//  Login
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu
class ProfileController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var functionTableView: UITableView!
    var listFunction = [Funciton]()
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        initView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: IBAction
    @IBAction func onLogOut(_ sender: Any) {
        dismiss(animated: false, completion: nil)
        (UIApplication.shared.delegate as? AppDelegate)?.setupNavigationViewController()
    }
    // MARK: initView
    func initView() {
        tabBarController?.tabBar.isHidden = false
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
        navigationController?.navigationBar.isHidden = true
        logOutButton.layer.cornerRadius = 4
        listFunction = [Funciton("icChamCong", "Chấm công"),
                        Funciton("icPhepCopy", "Nghỉ phép"),
                        Funciton("icChamXongNgoaiCongTy", "Chấm công ngoài công ty"),
                        Funciton("icNhanSu", "Nhân sự") ,
                        Funciton("icDuyetRequest", "Duyệt Request"),
                        Funciton("icDuyetChamCongNgoaiCongTy", "Duyệt chấm công ngoài công ty"),
                        Funciton("icPassword", "Đổi mật khẩu")]
        functionTableView.register(UINib(nibName: "FunctionTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    // MARK: Background Button when Click and Default
    func setBackgroudSelected(_ uiButton: UIButton) {
        uiButton.layer.backgroundColor = UIColor(red: 35/255, green: 61/255, blue: 117/255, alpha: 1).cgColor
    }
    func setBackgroundDefault(_ uiButton: UIButton) {
        uiButton.layer.backgroundColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1).cgColor
    }
}
extension ProfileController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFunction.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: FunctionTableViewCell =
            functionTableView.dequeueReusableCell(withIdentifier: "cell",
                                                  for: indexPath) as? FunctionTableViewCell else {
            return UITableViewCell()
        }
        cell.logoImage.image = UIImage(named: listFunction[indexPath.row].logoImage)
        cell.contentLabel.text = listFunction[indexPath.row].content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = functionTableView.cellForRow(at: indexPath)?.contentView {
            item.isSelected(true, "ProfileController")
            item.setBorder(true)
        }
        switch indexPath.row {
        case 0:
            let timeKeepingController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
            navigationController?.pushViewController(timeKeepingController, animated: true)
        case 3:
            let personViewController = PersonnelViewController(nibName: "PersonnelViewController", bundle: nil)
            navigationController?.pushViewController(personViewController, animated: true)
        case 4:
            let browseRequestViewController =
                BrowseRequestViewController(nibName: "BrowseRequestViewController", bundle: nil)
            navigationController?.pushViewController(browseRequestViewController, animated: true)
        case 6:
            let changePasswordController = ChangePasswordViewController(
                nibName: "ChangePasswordViewController", bundle: nil)
            navigationController?.pushViewController(changePasswordController, animated: true)
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let item = functionTableView.cellForRow(at: indexPath)?.contentView {
            item.isSelected(false, "ProfileController")
            item.setBorder(false)
        }
    }
}
extension ProfileController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
extension UIView {
    func isSelected(_ isSelected: Bool, _ screen: String) {
        if screen.isEqual("ProfileController") {
            self.backgroundColor = isSelected ?
                UIColor(red: 35/255, green: 61/255, blue: 117/255, alpha: 1) :
                UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
        } else if screen.isEqual("PersonnelViewController") {
            self.backgroundColor = isSelected ?
                UIColor(red: 35/255, green: 61/255, blue: 117/255, alpha: 1) :
                UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }
    }
    func setBorder(_ isSelected: Bool) {
        let border = CALayer()
        let width = CGFloat(4.0)
        border.borderColor = isSelected ? UIColor.white.cgColor :
            UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
