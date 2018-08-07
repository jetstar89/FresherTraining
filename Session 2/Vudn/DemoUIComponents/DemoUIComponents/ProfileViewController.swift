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
    // MARK: - Outlet

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var chamCongButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tag + " did load")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
