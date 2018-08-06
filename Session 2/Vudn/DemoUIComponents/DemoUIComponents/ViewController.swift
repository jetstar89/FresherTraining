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
        
        let forgotPasswordGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onShowForgotPasswordScreen(_:)))
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(forgotPasswordGestureRecognizer)
        
        let onTapViewGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
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
        // clear text in TextField
        usernameTextField.text = ""
        passwordTextField.text = ""
        hiddenPasswordImageView.isHidden = true
        view.endEditing(true)
    }
    
    @objc func onShowPassword(_ sender: UITapGestureRecognizer) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            hiddenPasswordImageView.frame = CGRect(x: hiddenPasswordImageView.frame.minX, y: hiddenPasswordImageView.frame.minY - 2, width: hiddenPasswordImageView.frame.width, height: 18)
            hiddenPasswordImageView.image = UIImage(named: "icNotView")
        } else {
            passwordTextField.isSecureTextEntry = true
            hiddenPasswordImageView.frame = CGRect(x: hiddenPasswordImageView.frame.minX, y: hiddenPasswordImageView.frame.minY + 2, width: hiddenPasswordImageView.frame.width, height: 14)
            hiddenPasswordImageView.image = UIImage(named: "icView")
        }
    }
    
    @objc func onShowForgotPasswordScreen(_ sender: UITapGestureRecognizer){
        let forgotPasswordController = ForgotPasswordController(nibName: "ForgotPasswordController", bundle: nil)
        navigationController?.pushViewController(forgotPasswordController, animated: true)
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
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwordTextField && passwordTextField.text == "" {
            //hide hiddenPasswordImageView
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
        let width = CGFloat(1.0)
        
        border.borderColor = isOnFocus ? UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0).cgColor : UIColor.init(red: 180/255, green: 182/255, blue: 197/255, alpha: 1.0).cgColor
        
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        self.textColor = isOnFocus ? UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) : UIColor.init(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
    }
}
