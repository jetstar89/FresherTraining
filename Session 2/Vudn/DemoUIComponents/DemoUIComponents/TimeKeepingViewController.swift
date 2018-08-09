//
//  TimeKeepingViewController.swift
//  DemoUIComponents
//
//  Created by Đinh Ngọc Vũ on 8/9/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class TimeKeepingViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerTextField.delegate = self
        confirmButton.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        answerTextField.setIsOnFocus(false)
        myScrollView.isScrollEnabled = false
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Time Keeping"
        navigationController?.navigationBar.barTintColor = UIColor.frenchBlue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
//        NotificationCenter.default.addObserver(self, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction

    @IBAction func onConfirm(_ sender: UIButton) {
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

extension TimeKeepingViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //myScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == answerTextField {
            answerTextField.setIsOnFocus(false)
        } else {
            // Do nothing
        }
        
        myScrollView.scrollsToTop = true
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        answerTextField.resignFirstResponder()
        return true
    }
}
