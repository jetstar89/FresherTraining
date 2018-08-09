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
    @IBOutlet weak var avatarImageView: UIImageView!
    var checkPress: Bool = false
    
    
    @IBOutlet weak var timeKeepingButton: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
        listButton = [timeKeepingButton]
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    // MARK: LifeCycle
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    // MARK: init and func
    @IBAction func logout(_ sender: Any) {
        (UIApplication.shared.delegate as? AppDelegate)?.setupNavigation()
        
    }
  
    
    @IBAction func actionTimeKeep(_ sender: Any) {
        setButtonColor(timeKeepingButton)
        let timekeepingController = TimeKeepingViewController(nibName: "TimeKeepingViewController", bundle: nil)
        navigationController?.pushViewController(timekeepingController, animated: true)
    }
    func setButtonColor(_ button: UIButton) {
        for item in listButton {
            if (item == button) {
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
    
    func initView() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.layer.masksToBounds = true
        logoutButton.layer.cornerRadius = 4
        logoutButton.layer.masksToBounds = true
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
