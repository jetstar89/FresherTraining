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
        (UIApplication.shared.delegate as? AppDelegate)?.setUpRootViewIsHomeTabbar()
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

extension UITextField {
    
    func setIsOnFocus(_ isOnFocus: Bool) {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(1.0)
        
        border.borderColor = isOnFocus ? UIColor.pumpkinOrange.cgColor : UIColor.silver.cgColor
        
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        self.textColor = isOnFocus ? UIColor.frenchBlue : UIColor.steelGrey
    }
}

extension UIColor {
    @nonobjc class var pumpkinOrange: UIColor {
        return UIColor(red: 242.0 / 255.0, green: 139.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var black50: UIColor {
        return UIColor(white: 0.0, alpha: 0.5)
    }
    
    @nonobjc class var white: UIColor {
        return UIColor(white: 1.0, alpha: 1.0)
    }
    
    @nonobjc class var frenchBlue: UIColor {
        return UIColor(red: 63.0 / 255.0, green: 95.0 / 255.0, blue: 163.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var steelGrey: UIColor {
        return UIColor(red: 120.0 / 255.0, green: 131.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var silver: UIColor {
        return UIColor(red: 180.0 / 255.0, green: 182.0 / 255.0, blue: 197.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkSlateBlue: UIColor {
        return UIColor(red: 35.0 / 255.0, green: 61.0 / 255.0, blue: 117.0 / 255.0, alpha: 1.0)
    }
}
