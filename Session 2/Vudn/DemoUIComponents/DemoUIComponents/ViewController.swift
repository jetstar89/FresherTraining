//
//  ViewController.swift
//  DemoUIComponents
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var hiddenPasswordImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerDelegate()
        registerGestureRecognizer()
    }
    
    func registerDelegate() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func registerGestureRecognizer() {
        let showPasswordGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                   action: #selector(onShowPassword(_:)))
        hiddenPasswordImageView.isUserInteractionEnabled = true
        hiddenPasswordImageView.addGestureRecognizer(showPasswordGestureRecognizer)
        
        let onTapViewGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameTextField.setIsOnFocus(false)
        passwordTextField.setIsOnFocus(false)                
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

extension ViewController: UITextFieldDelegate {
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
        textField.setIsOnFocus(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwordTextField && passwordTextField.text == "" {
            //show hiddenPasswordImageView
            hiddenPasswordImageView.isHidden = true
        } else {
            // do nothing
        }
        textField.setIsOnFocus(false)
    }
}

extension UITextField {
    
    func setIsOnFocus(_ isOnFocus: Bool) {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = isOnFocus ? UIColor.orange.cgColor : UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
