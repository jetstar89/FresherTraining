//
//  ForgotPasswordController.swift
//  DemoUIComponents
//
//  Created by Đinh Ngọc Vũ on 8/6/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    
    @IBOutlet weak var iconPlaneImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendRequestButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        registerGestureRecognizer()
    }
    
    func registerGestureRecognizer() {
        let onTapViewGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                action: #selector(onTapView(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(onTapViewGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        iconPlaneImageView.image = #imageLiteral(resourceName: "paper_plane")
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 95/255, blue: 163/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        navigationItem.title = "QUÊN MẬT KHẨU"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(onBack(_:)))
        emailTextField.setIsOnFocus(false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onTapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func onBack(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func onSendRequest(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension ForgotPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setIsOnFocus(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        textField.setIsOnFocus(false)
    }
    
}

//extension UITextField {
//    func setIsOnFocus(_ isOnFocus: Bool) {
//        let border = CALayer()
//        let width = CGFloat(1)
//
//        border.borderColor = isOnFocus ? UIColor.init(red: 239/255, green: 137/255, blue: 15/255, alpha: 1.0).cgColor : UIColor.init(red: 180/255, green: 182/255, blue: 197/255, alpha: 1.0).cgColor
//
//        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
//        border.borderWidth = width
//
//        self.layer.addSublayer(border)
//        self.layer.masksToBounds = true
//
//        self.textColor = isOnFocus ? UIColor.init(red: 63/255, green: 95/255, blue: 163/255, alpha: 1.0) : UIColor.init(red: 120/255, green: 131/255, blue: 140/255, alpha: 1.0)
//    }
//}
