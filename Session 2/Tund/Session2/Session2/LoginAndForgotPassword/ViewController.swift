//
//  ViewController.swift
//  Session2
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var showPasswordImageView: UIImageView!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var fresherTextField: UITextField!
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate()
        allViewGestureRecognizer()
        //navigation bar control
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        fresherTextField.setIsOnFocus(false)
        nameTextField.setIsOnFocus(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: initView
    func textFieldDelegate() {
        nameTextField.delegate = self
        fresherTextField.delegate = self
    }
    @objc func forgotPassword(_ rec: UITapGestureRecognizer) {
//        let forgotPassword = ForgotPassWordController(nibName: "ForgotPasswordController", bundle: nil)
//        navigationController?.pushViewController(forgotPassword, animated: true)
        let forgotPassword = ForgotPassWordController(nibName: "ForgotPassWordController", bundle: nil)
        navigationController?.pushViewController(forgotPassword, animated: true)
    }
    func allViewGestureRecognizer() {
        let forgotpassword: UITapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: #selector(forgotPassword))
        forgotPasswordLabel.isUserInteractionEnabled = true
        self.forgotPasswordLabel.addGestureRecognizer(forgotpassword)
        //tap Login butotn
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(login))
        loginButton.isUserInteractionEnabled = true
        self.loginButton.addGestureRecognizer(tap)
        //tap icon show password
        let showPasswordGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPassword(_:)))
        showPasswordImageView.isUserInteractionEnabled = true
        showPasswordImageView.addGestureRecognizer(showPasswordGestureRecognizer)

        //tap screen
        let onTapViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
    }
    @objc func login() {
        let username = fresherTextField.text ?? ""
        let password = nameTextField.text ?? ""
        if !username.isEmpty && !password.isEmpty {
            fresherTextField.text = ""
            nameTextField.text = ""
        } else {
            //
        }
        self.view.endEditing(true)
        (UIApplication.shared.delegate as? AppDelegate)?.setupTabbar()
    }
    @objc func showPassword(_ sender: UITapGestureRecognizer) {
        if nameTextField.isSecureTextEntry {
            nameTextField.isSecureTextEntry = false
            showPasswordImageView.frame =
                CGRect(x: showPasswordImageView.frame.minX,
                       y: showPasswordImageView.frame.minY - 2,
                       width: showPasswordImageView.frame.width,
                       height: 18)
            showPasswordImageView.image = UIImage(named: "icView")
        } else {
            nameTextField.isSecureTextEntry = true
            showPasswordImageView.frame = CGRect(
                x: showPasswordImageView.frame.minX,
                y: showPasswordImageView.frame.minY + 2,
                width: showPasswordImageView.frame.width,
                height: 14)
            showPasswordImageView.image = UIImage(named: "icshowView")
        }
    }
    @objc func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
// MARK: UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if  textField == fresherTextField {
            nameTextField.becomeFirstResponder()
        } else {
            nameTextField.resignFirstResponder()
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTextField {
            showPasswordImageView.isHidden = false
        } else {
            //
        }
        textField.setIsOnFocus(true)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField && nameTextField.text == "" {
            showPasswordImageView.isHidden = true
        } else {
            //
        }
        textField.setIsOnFocus(false)
    }
}
