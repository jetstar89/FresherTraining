//
//  ViewController.swift
//  Session2
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var fresherTextField: UITextField!
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        logoImageView .image = #imageLiteral(resourceName: "gem2017.png")
        settingTextField(nameTextField)
        settingTextField(fresherTextField)
        settingTextFieldPassword()
        
        fresherTextField.delegate = self
        nameTextField.delegate = self
      
        
        //bam dang nhap
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didLogin))
        loginButton.isUserInteractionEnabled = true
        self.loginButton.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func didTapView(_ recognizer: UITapGestureRecognizer) {
        print("tapGesture ")
    }
   
    @objc func longPress(_ re: UILongPressGestureRecognizer) {
        print("UILongPressGestureRecognizer")
    
    }
    @objc func swipeGesture1(_ re: UISwipeGestureRecognizer) {
        print("UISwipeGestureRecognizer")
    }
    @objc func didLogin() {
        let username = fresherTextField.text ?? ""
        let password = nameTextField.text ?? ""
        if(!username.isEmpty && !password.isEmpty) {
            fresherTextField.text = ""
            nameTextField.text = ""
            
        } else {
            //
        }
        self.view.endEditing(true)
        
    }
    @objc func settingTextField(_ textField: UITextField) {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.orange.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == fresherTextField) {
            print("Đang")
            nameTextField.becomeFirstResponder()
        } else if(textField == nameTextField) {
            nameTextField.resignFirstResponder()
        }
        
        return true
    }
    func settingTextFieldPassword() {
        print("Đang chay")
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(UIImage(named: "icView.png"),for: .normal)
        nameTextField.rightViewMode = .always
        nameTextField.rightView = button
        button.addTarget(self, action: #selector(eyesTouch(_:)), for: .touchUpInside)
        

    }
    @objc func eyesTouch(_ button: UIButton!){
        
        if(nameTextField.isSecureTextEntry) {
            button.setImage(UIImage(named: "icView.png"),for: .normal)
            nameTextField.isSecureTextEntry = fals
            
        } else {
          
            button.setImage(UIImage(named: "icshowView.png"),for: .normal)
            nameTextField.isSecureTextEntry = true
            
        }
        
    }
    
    
   
    
}

