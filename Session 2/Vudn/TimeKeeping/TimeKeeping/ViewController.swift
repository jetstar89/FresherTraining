//
//  ViewController.swift
//  DemoUIComponents
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import SideMenu

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
        loginButton.layer.cornerRadius = 4
        usernameTextField.setIsOnFocus(false)
        passwordTextField.setIsOnFocus(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("ViewController deinit")
    }

    @IBAction func onLogin(_ sender: UIButton) {
        // clear text in TextField
        usernameTextField.text = ""
        passwordTextField.text = ""
        hiddenPasswordImageView.isHidden = true
        view.endEditing(true)
        //(UIApplication.shared.delegate as? AppDelegate)?.setUpRootViewIsHomeTabbar()
        (UIApplication.shared.delegate as? AppDelegate)?.setUpRootViewIsTimeKeepingViewController()
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
    
    @objc func onShowForgotPasswordScreen(_ sender: UITapGestureRecognizer) {
        let forgotPasswordViewController = ForgotPasswordViewController(nibName: "ForgotPasswordViewController", bundle: nil)
        navigationController?.pushViewController(forgotPasswordViewController, animated: true)
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
            //hide hiddenPasswordImageView
            hiddenPasswordImageView.isHidden = true
        } else {
            // do nothing
        }
        textField.setIsOnFocus(false)
    }
}
