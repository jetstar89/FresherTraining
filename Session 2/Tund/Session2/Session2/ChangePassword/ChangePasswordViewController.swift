//
//  ChangePasswordViewController.swift
//  Session2
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var showNewPasswordAgainImageView: UIImageView!
    
    @IBOutlet weak var newPasswordAgainTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var showNewPasswordImageView: UIImageView!
    @IBOutlet weak var changePasswordButton: UIButton!
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        tapImageView()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        oldPasswordTextField.setIsOnFocus(false)
        newPasswordAgainTextField.setIsOnFocus(false)
        newPasswordTextField.setIsOnFocus(false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: init view
    func initView() {
        navigationItem.title = "ĐỔI MẬT KHẨU"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "left-arrow"), style: .plain, target: self, action: #selector(onBack))
        
        changePasswordButton.layer.cornerRadius = 2
        changePasswordButton.layer.masksToBounds = true
    }
    func tapImageView(){
        //tap icon show password
        let showPasswordGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPassword(_:)))
        showNewPasswordImageView.isUserInteractionEnabled = true
        showNewPasswordImageView.addGestureRecognizer(showPasswordGestureRecognizer)
        
        let showPasswordAgain = UITapGestureRecognizer(target: self, action: #selector(showPasswordAgainFunc(_:)))
        showNewPasswordAgainImageView.isUserInteractionEnabled =  true
        showNewPasswordAgainImageView.addGestureRecognizer(showPasswordAgain)
        
        //tap screen
        let onTapViewGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
        
    }
    
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func showPasswordAgainFunc(_ sender: UITapGestureRecognizer) {
        if newPasswordAgainTextField.isSecureTextEntry {
            newPasswordAgainTextField.isSecureTextEntry = false
            showNewPasswordAgainImageView.image = UIImage(named: "icView")
        } else {
            newPasswordAgainTextField.isSecureTextEntry = true
            showNewPasswordAgainImageView.image = UIImage(named: "icshowView")
        }
        
        
        
    }
    
    @objc func showPassword(_ sender: UITapGestureRecognizer) {
        if newPasswordTextField.isSecureTextEntry {
            newPasswordTextField.isSecureTextEntry = false
            showNewPasswordImageView.image = UIImage(named: "icView")
        } else {
            newPasswordTextField.isSecureTextEntry = true
            showNewPasswordImageView.image = UIImage(named: "icshowView")
        }
       
        
        
    }
    @objc func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
// MARK: UITextFieldDelegate
extension ChangePasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if  textField == oldPasswordTextField {
            newPasswordTextField.becomeFirstResponder()
        } else {
            newPasswordAgainTextField.resignFirstResponder()
        }
        if textField == newPasswordTextField {
            newPasswordAgainTextField.becomeFirstResponder()
        } else {
            newPasswordAgainTextField.resignFirstResponder()
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == newPasswordTextField {
            showNewPasswordImageView.isHidden = false
        } else if textField == newPasswordAgainTextField {
            showNewPasswordAgainImageView.isHidden = false
        } else {
            //
        }
        textField.setIsOnFocus(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == newPasswordTextField && newPasswordTextField.text == "" {
            showNewPasswordImageView.isHidden = true
        } else if textField == newPasswordAgainTextField && newPasswordAgainTextField.text == ""{
            showNewPasswordAgainImageView.isHidden = true
        } else {
            
        }
        textField.setIsOnFocus(false)
    }
    
    
   
    
}


