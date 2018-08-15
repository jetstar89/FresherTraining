//
//  ChangePasswordViewController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/10/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit
import SideMenu

class ChangePasswordViewController: UIViewController {
    let tag = "ChangePasswordViewController"
    // MARK: - IBOutlet
    
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordHiddenButton: UIButton!
    @IBOutlet weak var confirmNewPasswordHiddenButton: UIButton!
    @IBOutlet weak var agreeButton: UIButton!
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oldPasswordTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmNewPasswordTextField.delegate = self
        agreeButton.layer.cornerRadius = 4
        print(tag + " did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        oldPasswordTextField.setIsOnFocus(false)
        newPasswordTextField.setIsOnFocus(false)
        confirmNewPasswordTextField.setIsOnFocus(false)
        
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.isHidden = false
            navigationItem.title = "ĐỔI MẬT KHẨU"
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_back"), style: .done, target: self, action: #selector(onBack(_:)))
        print(tag + " did appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        print(tag + " did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print(tag + " deinit")
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
            let cgRect = CGRect(x: confirmNewPasswordHiddenButton.frame.minX, y: confirmNewPasswordHiddenButton.frame.minY - 2, width: confirmNewPasswordHiddenButton.frame.width, height: 18)
            confirmNewPasswordHiddenButton.frame = cgRect
            confirmNewPasswordHiddenButton.setImage(#imageLiteral(resourceName: "icNotView"), for: .normal)
        } else {
            confirmNewPasswordTextField.isSecureTextEntry = true
            let cgRect = CGRect(x: confirmNewPasswordHiddenButton.frame.minX, y: confirmNewPasswordHiddenButton.frame.minY + 2, width: confirmNewPasswordHiddenButton.frame.width, height: 14)
            confirmNewPasswordHiddenButton.frame = cgRect
            confirmNewPasswordHiddenButton.setImage(#imageLiteral(resourceName: "icView"), for: .normal)
        }
    }
    
    @IBAction func onAgree(_ sender: UIButton) {
        // Do something
        print("Agree change password")
    }
    
    // MARK: = Selector
    
    @objc func onBack(_ sender: MainNavigationController) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Extension

extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case oldPasswordTextField:
            oldPasswordTextField.setIsOnFocus(true)

        case newPasswordTextField:
            newPasswordTextField.setIsOnFocus(true)
            newPasswordHiddenButton.isHidden = false

        case confirmNewPasswordTextField:
            confirmNewPasswordTextField.setIsOnFocus(true)
            confirmNewPasswordHiddenButton.isHidden = false

        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case oldPasswordTextField:
            oldPasswordTextField.setIsOnFocus(false)
            
        case newPasswordTextField:
            newPasswordTextField.setIsOnFocus(false)
            newPasswordHiddenButton.isHidden = true
            
        case confirmNewPasswordTextField:
            confirmNewPasswordTextField.setIsOnFocus(false)
            confirmNewPasswordHiddenButton.isHidden = true
            
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
