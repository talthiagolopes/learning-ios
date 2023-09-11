//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Cocoapods dependency is doing the magic
        titleLabel.text = "⚡️FlashChat"
        
        // Manually added in order to get back by default, should be setting titleLabel as UILabel instead CLTypingLabel (cocoapods dependency)
        /*
        titleLabel.text = ""
        var timerIndex = 0.0
        let titleText = "⚡️FlashChat"

        for letter in titleText {
            print(letter)
            print(0.1 * timerIndex)
            print("-----)")
            Timer.scheduledTimer(withTimeInterval: 0.1 * timerIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            timerIndex += 1
        }
        */
    }
    

}
