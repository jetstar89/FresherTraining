//
//  ChangePasswordViewController.swift
//  Login
//
//  Created by admin on 8/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    var showNewPasswordButton: UIButton!
    var showAgainNewPasswordButton: UIButton!
    @IBOutlet weak var passWordAgainNewTextField: UITextField!
    @IBOutlet weak var passWordNewTextField: UITextField!
    @IBOutlet weak var passWordOldTextField: UITextField!
    // MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        registerEvents()
        addGestureView()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: initView
    func initView() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "ĐỔI MẬT KHẨU"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor =
            UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(image: UIImage(named: "left"), style: .plain, target: self, action: #selector(onBack))
        setBorderTextField(passWordOldTextField,
                           UIColor(red: 182/255, green: 190/255, blue: 197/255, alpha: 1))
        setBorderTextField(passWordNewTextField,
                           UIColor(red: 182/255, green: 190/255, blue: 197/255, alpha: 1))
        setBorderTextField(passWordAgainNewTextField,
                           UIColor(red: 182/255, green: 190/255, blue: 197/255, alpha: 1))
        showIconNewPassword()
        showIconAgainNewPassword()
    }
    @objc func addGestureView() {
        view.isUserInteractionEnabled = true
        let tapGestureView = UITapGestureRecognizer(target: self, action: #selector(onTapView(_:)))
        view.addGestureRecognizer(tapGestureView)
    }
    @objc func onTapView(_ getture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    func registerEvents() {
        passWordOldTextField.delegate = self
        passWordNewTextField.delegate = self
        passWordAgainNewTextField.delegate = self
    }
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }
    func showIconNewPassword() {
        showAgainNewPasswordButton  = UIButton(type: .custom)
        showAgainNewPasswordButton.frame = CGRect(x: 0, y: 0, width: 22, height: 18)
        showAgainNewPasswordButton.setImage(UIImage(named: "icView.png"), for: .normal)
        passWordAgainNewTextField.rightViewMode = .always
        passWordAgainNewTextField.rightView = showAgainNewPasswordButton
        showAgainNewPasswordButton.addTarget(self, action: #selector(onShowNewPassword(_:)), for: .touchUpInside)
        showAgainNewPasswordButton.isHidden = true
    }
    @objc func onShowNewPassword(_ button: UIButton!) {
        if passWordAgainNewTextField.isSecureTextEntry {
            showAgainNewPasswordButton.setImage(UIImage(named: "icViewShow.png"), for: .normal)
            passWordAgainNewTextField.isSecureTextEntry = false
        } else {
            showAgainNewPasswordButton.setImage(UIImage(named: "icView.png"), for: .normal)
            passWordAgainNewTextField.isSecureTextEntry = true
        }
    }
    func showIconAgainNewPassword() {
        showNewPasswordButton  = UIButton(type: .custom)
        showNewPasswordButton.frame = CGRect(x: 0, y: 0, width: 22, height: 18)
        showNewPasswordButton.setImage(UIImage(named: "icView.png"), for: .normal)
        passWordNewTextField.rightViewMode = .always
        passWordNewTextField.rightView = showNewPasswordButton
        showNewPasswordButton.addTarget(self, action: #selector(onShowAgainNewPassword(_:)), for: .touchUpInside)
        showNewPasswordButton.isHidden = true
    }
    @objc func onShowAgainNewPassword(_ button: UIButton!) {
        if passWordNewTextField.isSecureTextEntry {
            showNewPasswordButton.setImage(UIImage(named: "icViewShow.png"), for: .normal)
            passWordNewTextField.isSecureTextEntry = false
        } else {
            showNewPasswordButton.setImage(UIImage(named: "icView.png"), for: .normal)
            passWordNewTextField.isSecureTextEntry = true
        }
    }
    func setBorderTextField(_ textField: UITextField, _ uiColor: UIColor) {
        let borderTextField = CALayer()
        let width = CGFloat(2.0)
        let color = uiColor
        borderTextField.borderColor = color.cgColor
        borderTextField.frame = CGRect(x: 0, y: textField.frame.size.height - width,
                                       width: textField.frame.size.width, height: textField.frame.size.height)
        borderTextField.borderWidth = width
        textField.layer.addSublayer(borderTextField)
        textField.layer.masksToBounds = true
    }
    // MARK: IBAction
    @IBAction func onChangePassword(_ sender: UIButton) {
        let alert = UIAlertController(title: "Thông báo", message: "Đổi mật khẩu thành công", preferredStyle: .alert)
        let btnOK = UIAlertAction(title: "Đồng ý", style: .default, handler: nil)
        alert.addAction(btnOK)
        present(alert, animated: true, completion: nil)
    }
}
extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passWordOldTextField {
            passWordNewTextField.becomeFirstResponder()
        } else if textField == passWordNewTextField {
            passWordAgainNewTextField.becomeFirstResponder()
        } else if textField == passWordAgainNewTextField {
            passWordAgainNewTextField.resignFirstResponder()
        }
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == passWordOldTextField {
            passWordOldTextField.textColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
            setBorderTextField(passWordOldTextField,
                               UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0))
        } else if textField == passWordNewTextField {
            passWordNewTextField.textColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
            setBorderTextField(passWordNewTextField,
                               UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0))
        } else if textField == passWordAgainNewTextField {
            passWordAgainNewTextField.textColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
            setBorderTextField(passWordAgainNewTextField,
                               UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0))
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passWordNewTextField {
            showNewPasswordButton.isHidden = false
        } else if textField == passWordAgainNewTextField {
            showAgainNewPasswordButton.isHidden = false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passWordOldTextField {
            passWordOldTextField.textColor =
                UIColor(red: 182/255, green: 190/255, blue: 197/255, alpha: 1)
            setBorderTextField(passWordOldTextField,
                               UIColor(red: 182/255, green: 190/255, blue: 197/255, alpha: 1))
        } else if textField == passWordNewTextField {
            passWordNewTextField.textColor =
                UIColor(red: 182/255, green: 190/255, blue: 197/255, alpha: 1)
            setBorderTextField(passWordNewTextField,
                               UIColor(red: 182/255, green: 190/255, blue: 197/255, alpha: 1))
            if passWordNewTextField.text == "" {
                showNewPasswordButton.isHidden = true
            }
        } else if textField == passWordAgainNewTextField {
            passWordAgainNewTextField.textColor =
                UIColor(red: 182/255, green: 190/255, blue: 197/255, alpha: 1)
            setBorderTextField(passWordAgainNewTextField,
                               UIColor(red: 182/255, green: 190/255, blue: 197/255, alpha: 1))
            if passWordAgainNewTextField.text == "" {
                showAgainNewPasswordButton.isHidden = true
            }
        }
    }
}
