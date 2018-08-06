//
//  ViewController.swift
//  Login
//
//  Created by admin on 8/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    
    @IBAction func login(_ sender: Any) {
        nameTextField.text = ""
        passWordTextField.text = ""
        let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Bạn đã đăng nhập", preferredStyle: .alert);
        let btnOK = UIAlertAction(title: "Đồng ý", style: .cancel, handler: nil)
        alert.addAction(btnOK)
        present(alert, animated: true, completion: nil)
    }
    var border: CALayer!
    var enablePasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var fogotLabel: UILabel!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var logoImageView: UIImageView!
     @IBOutlet weak var hidePasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.logoImageView.image = #imageLiteral(resourceName: "gem2017.png")
        initView()
        setBorderTextField(nameTextField, UIColor.gray)
        setBorderTextField(passWordTextField, UIColor.gray)
        onTapFogotLabel()
        inVisiableKeyBroad()
        registerDelegate()
        showIconHidePassword()
    }
    func initView() {
        self.logoImageView.image = UIImage(named: "gem2017")
        self.logoImageView.contentMode = .scaleAspectFit
        nameTextField.textColor = UIColor(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
        passWordTextField.textColor = UIColor(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
    }
    func registerDelegate() {
        nameTextField.delegate = self
        passWordTextField.delegate = self
    }
    func showIconHidePassword() {
        enablePasswordButton  = UIButton(type: .custom)
        enablePasswordButton.frame = CGRect(x:0, y:0, width:22, height:18)
        enablePasswordButton.setImage(UIImage(named: "icView.png"), for: .normal)
        passWordTextField.rightViewMode = .always
        passWordTextField.rightView = enablePasswordButton
        enablePasswordButton.addTarget(self, action: #selector(self.tapEnablePassword(_:)), for: .touchUpInside)
        enablePasswordButton.isHidden = true
    }
    @objc func tapEnablePassword(_ button: UIButton!) {
        if passWordTextField.isSecureTextEntry {
            enablePasswordButton.setImage(UIImage(named: "icViewShow.png"), for: .normal)
            passWordTextField.isSecureTextEntry = false
        } else {
            enablePasswordButton.setImage(UIImage(named: "icView.png"), for: .normal)
            passWordTextField.isSecureTextEntry = true
        }
    }
    @objc func onTapFogotLabel() {
        fogotLabel.isUserInteractionEnabled = true
        let tapGestureFogotLabel = UITapGestureRecognizer(target: self, action: #selector(tapFogotLabel(_:)))
        fogotLabel.addGestureRecognizer(tapGestureFogotLabel)
    }
    
    @objc func inVisiableKeyBroad() {
        view.isUserInteractionEnabled = true
        let tapGestureView = UITapGestureRecognizer(target: self, action: #selector(tapView(_:)))
        view.addGestureRecognizer(tapGestureView)
    }
    
    @objc func tapView(_ getture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
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
            enablePasswordButton.isHidden = false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passWordTextField {
            passWordTextField.textColor = UIColor(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
            setBorderTextField(passWordTextField, UIColor.gray)
            if passWordTextField.text == "" {
                enablePasswordButton.isHidden = true
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
    @objc func tapFogotLabel(_ getture: UITapGestureRecognizer) {
        let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Bạn đang chọn chức năng quên mật khẩu", preferredStyle: .alert);
        let btnOK = UIAlertAction(title: "Đồng ý", style: .cancel, handler: nil)
        alert.addAction(btnOK)
        present(alert, animated: true, completion: nil)
        
    }
    func setBorderTextField(_ textField: UITextField, _ uiColor: UIColor) {
        border = CALayer()
        let width = CGFloat(2.0)
        let color = uiColor
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

