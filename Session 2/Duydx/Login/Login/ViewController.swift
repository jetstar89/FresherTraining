//
//  ViewController.swift
//  Login
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var borderTextField: CALayer!
    var showPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var fogotLabel: UILabel!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var logoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setBorderTextField(nameTextField, UIColor.gray)
        setBorderTextField(passWordTextField, UIColor.gray)
        addGestureFogotLabel()
        addGestureView()
        registerDelegate()
        showIconPassword()
        
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func login(_ sender: Any) {
        let userName = nameTextField.text!
        let passWord = passWordTextField.text!
        if userName.isEqual("") && passWord.isEqual("") {
            let screenLogin = HomeController(nibName: "HomeController", bundle: nil)
            navigationController?.pushViewController(screenLogin, animated: true)
            (UIApplication.shared.delegate as? AppDelegate)?.setupTabbarController()
        } else {
            let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Đăng nhập không thành công", preferredStyle: .alert);
            let btnOK = UIAlertAction(title: "Đồng ý", style: .cancel, handler: nil)
            alert.addAction(btnOK)
            present(alert, animated: true, completion: nil)
        }
    }
    func initView() {
        self.logoImageView.image = UIImage(named: "gem2017")
        self.logoImageView.contentMode = .scaleAspectFit
        nameTextField.textColor = UIColor(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
        passWordTextField.textColor = UIColor(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
            navigationController?.navigationBar.tintColor = UIColor.white
    }
    func registerDelegate() {
        nameTextField.delegate = self
        passWordTextField.delegate = self
    }
    func showIconPassword() {
        showPasswordButton  = UIButton(type: .custom)
        showPasswordButton.frame = CGRect(x:0, y:0, width:22, height:18)
        showPasswordButton.setImage(UIImage(named: "icView.png"), for: .normal)
        passWordTextField.rightViewMode = .always
        passWordTextField.rightView = showPasswordButton
        showPasswordButton.addTarget(self, action: #selector(self.onTapButtonShowPassword(_:)), for: .touchUpInside)
        showPasswordButton.isHidden = true
    }
    @objc func onTapButtonShowPassword(_ button: UIButton!) {
        if passWordTextField.isSecureTextEntry {
            showPasswordButton.setImage(UIImage(named: "icViewShow.png"), for: .normal)
            passWordTextField.isSecureTextEntry = false
        } else {
            showPasswordButton.setImage(UIImage(named: "icView.png"), for: .normal)
            passWordTextField.isSecureTextEntry = true
        }
    }
    @objc func addGestureFogotLabel() {
        fogotLabel.isUserInteractionEnabled = true
        let tapGestureFogotLabel = UITapGestureRecognizer(target: self, action: #selector(onTapFogotLabel(_:)))
        fogotLabel.addGestureRecognizer(tapGestureFogotLabel)
    }
    
    @objc func addGestureView() {
        view.isUserInteractionEnabled = true
        let tapGestureView = UITapGestureRecognizer(target: self, action: #selector(onTapView(_:)))
        view.addGestureRecognizer(tapGestureView)
    }
    
    @objc func onTapView(_ getture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func onTapFogotLabel(_ getture: UITapGestureRecognizer) {
        let fogotPasswordController = FogotPasswordController(nibName: "FogotPasswordController", bundle: nil)
        navigationController?.pushViewController(fogotPasswordController, animated: true)
        
    }
    func setBorderTextField(_ textField: UITextField, _ uiColor: UIColor) {
        borderTextField = CALayer()
        let width = CGFloat(2.0)
        let color = uiColor
        borderTextField.borderColor = color.cgColor
        borderTextField.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
        
        borderTextField.borderWidth = width
        textField.layer.addSublayer(borderTextField)
        textField.layer.masksToBounds = true
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            passWordTextField.becomeFirstResponder()
        } else if textField == passWordTextField {
            passWordTextField.resignFirstResponder()
        }
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if (textField == nameTextField) {
            nameTextField.textColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
            setBorderTextField(nameTextField, UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0))
        } else if (textField == passWordTextField) {
            passWordTextField.textColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
            setBorderTextField(passWordTextField, UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0))
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passWordTextField {
            showPasswordButton.isHidden = false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passWordTextField {
            passWordTextField.textColor = UIColor(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
            setBorderTextField(passWordTextField, UIColor.gray)
            if passWordTextField.text == "" {
                showPasswordButton.isHidden = true
            }
        }
        if textField == nameTextField {
            setBorderTextField(nameTextField, UIColor.gray)
            nameTextField.textColor = UIColor(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
        }
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}

