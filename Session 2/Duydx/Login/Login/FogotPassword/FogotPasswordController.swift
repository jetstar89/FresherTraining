//
//  FogotPasswordController.swift
//  Login
//
//  Created by admin on 8/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FogotPasswordController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: initView
    func initView() {
        tabBarController?.tabBar.isHidden = true
        emailTextField.delegate = self
        setBorderTextField(emailTextField, UIColor.gray)
        navigationItem.title = "QUÊN MẬT KHẨU"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "left"), style: .plain, target: self, action: #selector(onBack))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
    }
    func setBorderTextField(_ textField: UITextField, _ uiColor: UIColor) {
        let borderTextField = CALayer()
        let width = CGFloat(2.0)
        let color = uiColor
        borderTextField.borderColor = color.cgColor
        borderTextField.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
        
        borderTextField.borderWidth = width
        textField.layer.addSublayer(borderTextField)
        textField.layer.masksToBounds = true
    }
    //MARK: IBAction
    @IBAction func sendRequest(_ sender: Any) {
        let alert = UIAlertController(title: "Thông báo", message: "Bạn đã gửi thành công", preferredStyle: .alert)
        let btnOk  = UIAlertAction(title: "Đồng ý", style: .default, handler: nil)
        alert.addAction(btnOk)
        present(alert, animated: true, completion: nil)
    }
}
//MARK: extension UITextFieldDelegate
extension FogotPasswordController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            emailTextField.resignFirstResponder()
        }
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if (textField == emailTextField) {
            emailTextField.textColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0)
            setBorderTextField(emailTextField, UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0))
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.textColor = UIColor(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
            setBorderTextField(emailTextField, UIColor.gray)
        }
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
    


}
