//
//  TimeKeepingViewController.swift
//  Session2
//
//  Created by admin on 8/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class TimeKeepingViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var timeKeepingTextField: UITextField!
    
    @IBOutlet weak var timeKeepingButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeKeepingTextField.delegate = self
        //tap screen
        let onTapViewGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
        initNav()
        
        

        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    // MARK: Navigation
    func initNav(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Time keeping"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
    }
    
    


}
