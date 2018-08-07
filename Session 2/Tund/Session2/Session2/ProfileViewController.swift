//
//  ProfileViewController.swift
//  Session2
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var chamCongView: UIView!
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView(){
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2.0
        avatarImageView.layer.masksToBounds = true
        logoutButton.layer.cornerRadius = 3
      
        // tap cham cong
        let tap  = UITapGestureRecognizer(target: self, action: #selector(chamCong(_:)))
        chamCongView.isUserInteractionEnabled = true
        chamCongView.addGestureRecognizer(tap)
        
    }
    @IBAction func logoutAction(_ sender: Any) {
        print("back to login")
    (UIApplication.shared.delegate as? AppDelegate)?.setupNavigation()
        
    }
    
    
    @objc func chamCong(_ sender: UITapGestureRecognizer) {
        
        chamCongView.backgroundColor = UIColor.init(red: 35/255, green: 61/255, blue: 117/255, alpha: 1.0)
       
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

