//
//  NewsDetailViewController.swift
//  News-Feed
//
//  Created by Zehaotian Lin on 9/27/20.
//  Copyright © 2020 Linghang Inc. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var play_button: UIButton!
    @IBOutlet weak var pause_button: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    // actions
    @IBAction func play_btn_click(_ sender: UIButton) {
        play_button.isHidden = true
        pause_button.isHidden = false
        self.playSound()
    }
    
    @IBAction func pause_btn_click(_ sender: UIButton) {
        play_button.isHidden = false
        pause_button.isHidden = true
        self.pauseSound()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        play_button.isHidden = false
        pause_button.isHidden = true
    }

    var player: AVAudioPlayer?
    var isPlayerInitialized: Bool = false

    func playSound() {
        if (isPlayerInitialized) {
            self.player?.play()
            return
        }
        
        guard let url = Bundle.main.url(forResource: "reading_sample", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()
            isPlayerInitialized = true
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func pauseSound() {
        self.player?.pause()
    }
    
    var timer = Timer()

    override func viewDidLoad() {
        scheduledTimerWithTimeInterval()
    }

    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateProgressView), userInfo: nil, repeats: true)
    }

    @objc func updateProgressView(){
        guard let player = player else { return }
        progressView.progress = Float(player.currentTime / player.duration)
    }
}
