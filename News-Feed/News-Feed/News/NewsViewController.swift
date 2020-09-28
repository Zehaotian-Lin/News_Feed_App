//
//  NewsViewController.swift
//  News-Feed
//
//  Created by Zehaotian Lin on 9/27/20.
//  Copyright © 2020 Linghang Inc. All rights reserved.
//

import UIKit
import Foundation

class NewsViewController: UIViewController {
    @IBOutlet weak var news_button: UIButton!
    
    // actions
    @IBAction func showNews(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showNewsSegue", sender: nil)
        
    }
}
