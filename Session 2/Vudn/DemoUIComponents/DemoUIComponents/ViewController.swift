//
//  ViewController.swift
//  DemoUIComponents
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var hiddenPasswordImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerDelegate()
        registerGesturRecognizer()
    }
    
    func registerDelegate() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func registerGesturRecognizer() {
        let showPasswordGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onShowPassword(_:)))
        hiddenPasswordImageView.isUserInteractionEnabled = true
        hiddenPasswordImageView.addGestureRecognizer(showPasswordGestureRecognizer)
        
        let onTapViewGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        logoImageView.image = UIImage(named: "gem2017")
        hiddenPasswordImageView.image = UIImage(named: "icView")
        hiddenPasswordImageView.isHidden = true
        
        usernameTextField.setGrayBottomBorder()
        passwordTextField.setGrayBottomBorder()
        
        passwordTextField.isSecureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(_ sender: UIButton) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if  textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwordTextField {
            // show image hidden password
            hiddenPasswordImageView.isHidden = false
        } else {
            // do nothing
        }
        textField.setOrangeBottomBorder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwordTextField && passwordTextField.text == "" {
            //show hiddenPasswordImageView
            hiddenPasswordImageView.isHidden = true
        } else {
            // do nothing
        }
        textField.setGrayBottomBorder()
    }
    
    @objc func onShowPassword(_ sender: UITapGestureRecognizer) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            hiddenPasswordImageView.image = UIImage(named: "icNotView")
        } else {
            passwordTextField.isSecureTextEntry = true
            hiddenPasswordImageView.image = UIImage(named: "icView")
        }
    }
    
    @objc func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

extension UITextField {
    func setOrangeBottomBorder() {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.orange.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setGrayBottomBorder() {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
