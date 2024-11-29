//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    var player = AVAudioPlayer()
    
    var secondsPassed = 0
    var totalTime = 0
    let eggTimes = ["Soft":300, "Medium":420, "Hard":720]
    var timer = Timer()
    var secondsRemaining = 60

    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        secondsRemaining = totalTime
        countdownLabel.text = String(secondsRemaining)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(updateTimer), userInfo: nil, repeats: true)
        
        print(eggTimes[hardness]!)
    }

    @objc func updateTimer(){
        if  secondsPassed < totalTime {
            secondsPassed += 1
            secondsRemaining -= 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
            countdownLabel.text = String(secondsRemaining)
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
            countdownLabel.text = "0"
        }
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                        
            }
    
}
