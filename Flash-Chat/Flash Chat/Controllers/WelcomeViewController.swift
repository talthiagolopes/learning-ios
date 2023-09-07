//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }
    

}
