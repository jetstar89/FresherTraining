//
//  Profile3ViewController.swift
//  Session2
//
//  Created by admin on 8/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class Profile3ViewController: UIViewController {
    var listButton: [UIButton] = []
    var listOption: [(image: UIImage, name: String)] = []
    @IBOutlet weak var avatarImageView: UIImageView!
    var checkPress: Bool = false
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var timeKeepingButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    var selectItemIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        listButton = [timeKeepingButton]
        menuTableView.dataSource = self
        menuTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    // MARK: LifeCycle
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    // MARK: init and func
    func initView() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.layer.masksToBounds = true
        timeKeepingButton.isHidden = true
        logoutButton.layer.cornerRadius = 4
        logoutButton.layer.masksToBounds = true
        // add list Method for tableView
        listOption = [(#imageLiteral(resourceName: "icChamCong"), "Chấm công"),
                      (#imageLiteral(resourceName: "icPhep"), "Nghỉ phép"),
                      (#imageLiteral(resourceName: "icChamCongNgoaiCongTy"), "Chấm công ngoài công ty"),
                      (#imageLiteral(resourceName: "icNhanSu"), "Nhân sự"),
                      (#imageLiteral(resourceName: "icDuyetRequest"), "Duyệt request"),
                      (#imageLiteral(resourceName: "icDuyetChamCongNgoaiCongTy"), "Duyệt chấm công ngoài công ty"),
                      (#imageLiteral(resourceName: "icPassword"), "Đổi mật khẩu")]
        menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    @IBAction func logout(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        (UIApplication.shared.delegate as? AppDelegate)?.setUpRootViewIsLoginViewController()
    }
    @IBAction func actionTimeKeep(_ sender: Any) {
        setButtonColor(timeKeepingButton)
        let timekeepingController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
        navigationController?.pushViewController(timekeepingController, animated: true)
    }
    func setButtonColor(_ button: UIButton) {
        for item in listButton {
            if item == button {
                setBackroundSelectd(item)
            } else {
                setBackgroundDefault(item)
            }
        }
    }
    func setBackroundSelectd(_ button: UIButton) {
        button.backgroundColor = UIColor.init(red: 35/255, green: 61/255, blue: 117/255, alpha: 1)
    }
    func setBackgroundDefault(_ button: UIButton) {
        button.backgroundColor = UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
    }
}
// MARK: UITableViewDataSource
extension Profile3ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = tableView.cellForRow(at: indexPath)?.contentView {
            item.iSelected(true)
        }
        switch indexPath.row {
        case 0:
            selectItemIndex = 0
            let timekeepingController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
                navigationController?.pushViewController(timekeepingController, animated: true)
            print(listOption[0].name)
        case 1:
            print("a")
            let vacationController = VacationViewController(nibName: "VacationViewController", bundle: nil)
            navigationController?.pushViewController(vacationController, animated: true)
        case 2:
            break
        case 3:
            let personController = PersonViewController(nibName: "PersonViewController", bundle: nil)
            navigationController?.pushViewController(personController, animated: true)
        case 4:
            break
        case 5:
            break
        case 6:
            let changePasswordController =
                ChangePasswordViewController(nibName: "ChangePasswordViewController",
                                             bundle: nil)
            navigationController?.pushViewController(changePasswordController, animated: true)
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let item = tableView.cellForRow(at: indexPath)?.contentView {
            item.iSelected(false)
        }
    }
}
// MARK: UITableViewDataSource
extension Profile3ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOption.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idenfier = "cell"
        guard let cell: MenuTableViewCell = menuTableView.dequeueReusableCell(
            withIdentifier: idenfier,
            for: indexPath) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        cell.functionImageView.image = listOption[indexPath.row].image
        cell.functionLabel.text = listOption[indexPath.row].name
        return cell
    }
}
