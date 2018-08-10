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
    var listButton: [UIButton] = []
    // MARK: - Outlet

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var timeKeepingButton: UIButton!
    @IBOutlet weak var vacationButton: UIButton!
    @IBOutlet weak var timeKeepingOutCorpButton: UIButton!
    @IBOutlet weak var humanResourceButton: UIButton!
    @IBOutlet weak var browseRequestButton: UIButton!
    @IBOutlet weak var browseTimeKeepingOutCorpButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tag + " did load")
        listButton = [timeKeepingButton, vacationButton, timeKeepingOutCorpButton, humanResourceButton, browseRequestButton, browseTimeKeepingOutCorpButton, changePasswordButton]
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
<<<<<<< HEAD
        menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
=======
        logOutButton.layer.cornerRadius = 4
>>>>>>> parent of 7c372eb... Edit UI using tableView
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
    
    @IBAction func onTimeKeepingButtonSelected(_ sender: UIButton) {
        setButtonBackground(sender)
        let timeKeepingViewController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
        navigationController?.pushViewController(timeKeepingViewController, animated: true)
    }
    
<<<<<<< HEAD
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
=======
    @IBAction func onVacationButtonSelected(_ sender: UIButton) {
        setButtonBackground(sender)
    }
    
    @IBAction func onTimeKeepingOutCorpButtomSelected(_ sender: UIButton) {
        setButtonBackground(sender)
>>>>>>> parent of 7c372eb... Edit UI using tableView
    }
    
    @IBAction func onHumanResourceButtonSelected(_ sender: UIButton) {
        setButtonBackground(sender)
    }
    
    @IBAction func onBrowseRequestButtonSelected(_ sender: UIButton) {
        setButtonBackground(sender)
    }
    
    @IBAction func onBrowseTimeKeepingOutCorpButtonSelected(_ sender: UIButton) {
        setButtonBackground(sender)
    }
    
    @IBAction func onChangePasswordButtonSelected(_ sender: UIButton) {
        setButtonBackground(sender)
    }
    
    @IBAction func onLogOut(_ sender: UIButton) {
        (UIApplication.shared.delegate as? AppDelegate)?.setUpRootViewIsLoginViewController()
    }
    
    func setButtonBackground(_ sender: UIButton) {
        for item in listButton {
            if item == sender {
                item.layer.backgroundColor = UIColor.darkSlateBlue.cgColor
            } else {
                item.layer.backgroundColor = UIColor.frenchBlue.cgColor
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
