//
//  ForgotPassWordController.swift
//  Session2
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ForgotPassWordController: UIViewController {
    @IBOutlet weak var sendTextField: UITextField!
    
  
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initView() {
        //setup textfield and button
        let border = CALayer()
        let width = CGFloat(1.0)
        sendButton.layer.cornerRadius = 2
        border.borderColor = UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: sendTextField.frame.size.height - width, width: sendTextField.frame.size.width, height: sendTextField.frame.size.height)
        border.borderWidth = width
        sendTextField.layer.addSublayer(border)
        sendTextField.layer.masksToBounds = true
        
        //set bar
        navigationItem.title = "QUÊN MẬT KHẨU"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(onBack))
        //tap to Screen
        let onTapViewGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
    }
    @IBAction func actionSendButton(_ sender: Any) {
        
    }
    @objc func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
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
