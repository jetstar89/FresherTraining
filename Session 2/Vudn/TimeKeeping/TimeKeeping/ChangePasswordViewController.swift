//
//  ChangePasswordViewController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/10/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordHiddenButton: UIButton!
    @IBOutlet weak var confirmNewPasswordHiddenButton: UIButton!
    @IBOutlet weak var agreeButton: UIButton!
    
    //MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oldPasswordTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmNewPasswordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        oldPasswordTextField.setIsOnFocus(false)
        newPasswordTextField.setIsOnFocus(false)
        confirmNewPasswordTextField.setIsOnFocus(false)
        navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IBAction
    @IBAction func onNewPasswordHidden(_ sender: UIButton) {
        if newPasswordTextField.isSecureTextEntry {
            newPasswordTextField.isSecureTextEntry = false
            newPasswordHiddenButton.frame = CGRect(x: newPasswordHiddenButton.frame.minX, y: newPasswordHiddenButton.frame.minY - 2, width: newPasswordHiddenButton.frame.width, height: 18)
            newPasswordHiddenButton.setImage(#imageLiteral(resourceName: "icNotView"), for: .normal)
        } else {
            newPasswordTextField.isSecureTextEntry = true
            newPasswordHiddenButton.frame = CGRect(x: newPasswordHiddenButton.frame.minX, y: newPasswordHiddenButton.frame.minY + 2, width: newPasswordHiddenButton.frame.width, height: 14)
            newPasswordHiddenButton.setImage(#imageLiteral(resourceName: "icView"), for: .normal)
        }
    }
    
    @IBAction func onConfirmNewPasswordHidden(_ sender: UIButton) {
        if confirmNewPasswordTextField.isSecureTextEntry {
            confirmNewPasswordTextField.isSecureTextEntry = false
            confirmNewPasswordHiddenButton.frame = CGRect(x: confirmNewPasswordHiddenButton.frame.minX, y: confirmNewPasswordHiddenButton.frame.minY - 2, width: confirmNewPasswordHiddenButton.frame.width, height: 18)
            confirmNewPasswordHiddenButton.setImage(#imageLiteral(resourceName: "icNotView"), for: .normal)
        } else {
            confirmNewPasswordTextField.isSecureTextEntry = true
            confirmNewPasswordHiddenButton.frame = CGRect(x: confirmNewPasswordHiddenButton.frame.minX, y: confirmNewPasswordHiddenButton.frame.minY + 2, width: confirmNewPasswordHiddenButton.frame.width, height: 14)
            confirmNewPasswordHiddenButton.setImage(#imageLiteral(resourceName: "icView"), for: .normal)
        }
    }
    
    @IBAction func onAgree(_ sender: UIButton) {
        // Do something
        print("Agree change password")
    }
    
}

// MARK: - Extension

extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case oldPasswordTextField:
            oldPasswordTextField.setIsOnFocus(true)
            break
        case newPasswordTextField:
            newPasswordTextField.setIsOnFocus(true)
            newPasswordHiddenButton.isHidden = false
            break
        case confirmNewPasswordTextField:
            confirmNewPasswordTextField.setIsOnFocus(true)
            confirmNewPasswordHiddenButton.isHidden = false
            break
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case oldPasswordTextField:
            oldPasswordTextField.setIsOnFocus(false)
            break
            
        case newPasswordTextField:
            newPasswordTextField.setIsOnFocus(false)
            newPasswordHiddenButton.isHidden = true
            break
            
        case confirmNewPasswordTextField:
            confirmNewPasswordTextField.setIsOnFocus(false)
            confirmNewPasswordHiddenButton.isHidden = true
            break
            
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case oldPasswordTextField:
            oldPasswordTextField.resignFirstResponder()
            newPasswordTextField.becomeFirstResponder()
            return true
            
        case newPasswordTextField:
            newPasswordTextField.resignFirstResponder()
            confirmNewPasswordTextField.becomeFirstResponder()
            return true
            
        case confirmNewPasswordTextField:
            confirmNewPasswordTextField.resignFirstResponder()
            return true
            
        default:
            return false
        }
    }
}
