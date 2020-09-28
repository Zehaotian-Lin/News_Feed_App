//
//  LoginViewController.swift
//  News-Feed
//
//  Created by Zehaotian Lin on 9/27/20.
//  Copyright © 2020 Linghang Inc. All rights reserved.
//
import UIKit
import Foundation

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //outlets
    @IBOutlet weak var username_input: UITextField!
    @IBOutlet weak var password_input: UITextField!
    @IBOutlet weak var login_button: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // actions
    @IBAction func loginBtn(_ sender: UIButton) {
        let username : String = username_input.text!
        let password : String = password_input.text!
        
        if (username.isEmpty || password.isEmpty) {
            let alert = UIAlertController(title: "Missing Info", message: "Please fill in both username and password.",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        
            
//        validLoginInfo(username, password, completion: { success in
//            if(success){
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            } else{
//                let alert = UIAlertController(title: "Cannot Login", message: "Wrong email or password.",
//                                              preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
//                                              handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
//        })
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            // Do any additional setup after loading the view.
            if self.username_input != nil {
                self.username_input.delegate = self
            }
            if self.password_input != nil {
                self.password_input.delegate = self
            }
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
            
            let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(true)
            navigationController?.setNavigationBarHidden(true, animated: false)
        }
    
//    //verify login information
//    private func validLoginInfo(_ username : String, _ password: String, completion: @escaping (_ success: Bool) -> ()){
//
//    }
    
    //textFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username_input.resignFirstResponder()  //if desired
        password_input.resignFirstResponder()
        loginBtn(login_button)
        return true
    }
    
    @objc func keyboardWillShow(notification:NSNotification){

        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification){

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
