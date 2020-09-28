//
//  ProfileViewController.swift
//  News-Feed
//
//  Created by Zehaotian Lin on 9/27/20.
//  Copyright © 2020 Linghang Inc. All rights reserved.
//

import UIKit
import Foundation

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func displayActionSheet(_ sender: UIBarButtonItem) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
            
        optionMenu.addAction(UIAlertAction(title: "Log Out", style: .destructive , handler:{ (UIAlertAction)in
            self.logout()
        }))

        optionMenu.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            
        }))
        
        if let popoverController = optionMenu.popoverPresentationController {
          popoverController.barButtonItem = sender
        }
            
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func logout(){
        self.performSegue(withIdentifier: "unwindToLogin", sender: nil)
//        KeychainWrapper.standard.removeObject(forKey: "authentication_token")
//        KeychainWrapper.standard.removeObject(forKey: "pk")
//
//
//        client.logout(completion: {success in
//            if (success){
//                KeychainWrapper.standard.removeObject(forKey: "authentication_token")
//                KeychainWrapper.standard.removeObject(forKey: "pk")
//                self.performSegue(withIdentifier: "unwindToLogin", sender: nil)
//
//            } else{
//                print("Failure in logout")
//            }
//        })
    }
    
}
