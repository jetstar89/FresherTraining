//
//  ProfileController.swift
//  Login
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    @IBAction func onLogOut(_ sender: Any) {
        (UIApplication.shared.delegate as? AppDelegate)?.setupNavigationController()
    }
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
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
    
    func initView() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        navigationController?.navigationBar.isHidden = true
        logOutButton.layer.cornerRadius = 4
    }

}
