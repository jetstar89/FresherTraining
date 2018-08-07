//
//  ViewController.swift
//  Session2
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    @IBOutlet weak var hiddenPasswordImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var fresherTextField: UITextField!
    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate()
        allViewGestureRecognizer()
        
        var navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
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
    @objc func forgotPassword(_ rec: UITapGestureRecognizer){
//        let forgotPassword = ForgotPassWordController(nibName: "ForgotPasswordController", bundle: nil)
//        navigationController?.pushViewController(forgotPassword, animated: true)
        let forgotPassword = ForgotPassWordController(nibName: "ForgotPassWordController", bundle: nil)
        navigationController?.pushViewController(forgotPassword, animated: true)
    }
    
    func allViewGestureRecognizer() {
        
        let forgotpassword: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(forgotPassword))
        forgotPasswordLabel.isUserInteractionEnabled = true
        self.forgotPasswordLabel.addGestureRecognizer(forgotpassword)
        
        //tap Login butotn
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(login))
        loginButton.isUserInteractionEnabled = true
        self.loginButton.addGestureRecognizer(tap)
        
        //tap icon show password
        let showPasswordGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPassword(_:)))
        hiddenPasswordImageView.isUserInteractionEnabled = true
        hiddenPasswordImageView.addGestureRecognizer(showPasswordGestureRecognizer)
        
        //tap screen
        let onTapViewGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
    }
   
    @objc func login() {
    
        
        let username = fresherTextField.text ?? ""
        let password = nameTextField.text ?? ""
        if(!username.isEmpty && !password.isEmpty) {
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
            hiddenPasswordImageView.frame = CGRect(x: hiddenPasswordImageView.frame.minX, y: hiddenPasswordImageView.frame.minY - 2, width: hiddenPasswordImageView.frame.width, height: 18)
            hiddenPasswordImageView.image = UIImage(named: "icView")
        } else {
            nameTextField.isSecureTextEntry = true
            hiddenPasswordImageView.frame = CGRect(x: hiddenPasswordImageView.frame.minX, y: hiddenPasswordImageView.frame.minY + 2, width: hiddenPasswordImageView.frame.width, height: 14)
            hiddenPasswordImageView.image = UIImage(named: "icshowView")
        }
    }
    @objc func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
//MARK: UITextFieldDelegate
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
            hiddenPasswordImageView.isHidden = false
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
            hiddenPasswordImageView.isHidden = true
        } else {
            //
        }
        textField.setIsOnFocus(false)
    }
    
}
//MARK: control textfield
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


