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
    
    @IBOutlet weak var eggsLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft":  3, "Medium":  5, "Hard": 7] // 5m=300s,7n=420s or 12m=720s
    var totalTime = 0
    var secondPassed = 0
    var timer  = Timer()
    var player: AVAudioPlayer!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!  //Soft, Medium or Hard
        progressBar.progress = 0.0
        secondPassed = 0
        eggsLabel.text = "\(hardness) eggs in progress.."
        
        print("\(totalTime) totalTime")
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if(secondPassed < totalTime) {
            
            print("\(secondPassed) seconds passed...")

            secondPassed += 1
            
            progressBar.progress = Float(secondPassed) / Float(totalTime)
        }
        else {
            timer.invalidate()
            eggsLabel.text =   "The eggs was finished! =)"
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
