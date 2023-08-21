//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Thiago Américo Lopes on 15/08/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController {
    
    var bodyMassValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label  = UILabel()
        label.text = self.bodyMassValue
        label.frame  = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }

}
