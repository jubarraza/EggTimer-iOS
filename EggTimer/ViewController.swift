//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var secondsPassed = 0
    var totalTime = 0
    let eggTimes = ["Soft":300, "Medium":420, "Hard":720]
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(updateTimer), userInfo: nil, repeats: true)
        
        print(eggTimes[hardness]!)
    }

    @objc func updateTimer(){
        if  secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    
    
}
