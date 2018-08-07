//
//  ProfileController.swift
//  Login
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var vacationButton: UIButton!
    @IBOutlet weak var timeKeepingButton: UIButton!
    @IBOutlet weak var externalCompanyButton: UIButton!
    @IBOutlet weak var personnelButton: UIButton!
    @IBOutlet weak var requestBrowseButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var requestTimeKeepButton: UIButton!
    var listUIButton: Array<UIButton> = Array<UIButton>()
    //MARK: Lifecycle
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
    //MARK: IBAction
    @IBAction func onLogOut(_ sender: Any) {
        (UIApplication.shared.delegate as? AppDelegate)?.setupNavigationController()
    }
    //MARK: initView
    func initView() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
        navigationController?.navigationBar.isHidden = true
        logOutButton.layer.cornerRadius = 4
        listUIButton = [timeKeepingButton, vacationButton, externalCompanyButton, personnelButton, requestBrowseButton, requestTimeKeepButton, changePasswordButton]
        onBackground(listUIButton, nil)
    }
    //MARK: Background Button when Click and Default
    func setBackgroudSelected(_ uiButton: UIButton) {
        uiButton.layer.backgroundColor = UIColor(red: 35/255, green: 61/255, blue: 117/255, alpha: 1).cgColor
    }
    func setBackgroundDefault(_ uiButton: UIButton) {
        uiButton.layer.backgroundColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1).cgColor
    }
    func onBackground(_ listButton: Array<UIButton>,_ uiButton: UIButton?) {
        for items in listUIButton {
            if items == uiButton {
                setBackgroudSelected(uiButton!)
            } else {
                setBackgroundDefault(items)
            }
        }
    }
    //MARK: IBAction
    @IBAction func onPressVacationButton(_ sender: UIButton) {
        onBackground(listUIButton, vacationButton)
    }
    @IBAction func onPressTimeKeeping(_ sender: UIButton) {
        onBackground(listUIButton, timeKeepingButton)
    }
    @IBAction func onPresseExternalCompany(_ sender: UIButton) {
        onBackground(listUIButton, externalCompanyButton)
    }
    
    @IBAction func onPressPersonnel(_ sender: UIButton) {
        onBackground(listUIButton, personnelButton)
    }
    
    @IBAction func onPressRequestBrowse(_ sender: UIButton) {
        onBackground(listUIButton, requestBrowseButton)
    }
    @IBAction func onPressRequestTimeKeep(_ sender: UIButton) {
        onBackground(listUIButton, requestTimeKeepButton)
    }
    @IBAction func onPressChangePassword(_ sender: UIButton) {
        onBackground(listUIButton, changePasswordButton)
    }

}
