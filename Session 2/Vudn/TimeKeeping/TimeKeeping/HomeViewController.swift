//
//  HomeController.swift
//  DemoUIComponents
//
//  Created by Đinh Ngọc Vũ on 8/6/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeViewController: UIViewController {
    let tag = "HomeViewController"
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tag + " did load")
        // Do any additional setup after loading the view.
        
        let userDefault = UserDefaults.standard
        userDefault.set("VU", forKey: "username")
        userDefault.synchronize()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Home"
        print(tag + " will appear")
        
        let userDefault = UserDefaults.standard
        userDefault.value(forKey: "username")                
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
    
    @IBAction func onChangerTabIndex(_ sender: UIButton) {
        
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
