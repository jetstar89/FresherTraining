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
        let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Bạn đã đăng nhập", preferredStyle: .alert);
        let btnOK = UIAlertAction(title: "Đồng ý", style: .cancel, handler: nil)
        alert.addAction(btnOK)
        present(alert, animated: true, completion: nil)
    }
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
        self.logoImageView.image = #imageLiteral(resourceName: "gem2017.png")
        self.logoImageView.contentMode = .scaleAspectFit
        setBorderTextField(nameTextField)
        setBorderTextField(passWordTextField)
        onTapFogotLabel()
        inVisiableKeyBroad()
        nameTextField.delegate = self
        passWordTextField.delegate = self
        showIconHidePassword();
    }
    func showIconHidePassword() {
        enablePasswordButton  = UIButton(type: .custom)
        enablePasswordButton.frame = CGRect(x:0, y:0, width:30, height:30)
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passWordTextField {
            enablePasswordButton.isHidden = false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passWordTextField && passWordTextField.text == "" {
            enablePasswordButton.isHidden = true
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
    func setBorderTextField(_ textField: UITextField) {
        let border = CALayer()
        let width = CGFloat(2.0)
        let color = UIColor.brown
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

