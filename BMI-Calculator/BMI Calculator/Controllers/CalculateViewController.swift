//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Foundation

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    let SEGUE_INDENTIFIER_RESULT  = "goToResult"
    
    var calculateBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func heightSliderChanged(_ sender: UISlider) {

        let heightValue = String(format: "%.2f",  sender.value)
        heightValueLabel.text = "\(heightValue)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {

        let weightValue = String(format: "%.0f",  sender.value)
        weightValueLabel.text = "\(weightValue)kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let  heightSliderValue = heightSlider.value
        let weightSliderValue = weightSlider.value
        
        calculateBrain.calculateBodyMassIndex(height: heightSliderValue, weight:  weightSliderValue)
        

        // E.g.: Connecting directly
//        let secondViewController = SecondViewController()
//        secondViewController.bodyMassValue = String(format: "%.1f", bodyMassIndex)
//
//        self.present(secondViewController, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: self.SEGUE_INDENTIFIER_RESULT, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == self.SEGUE_INDENTIFIER_RESULT) {
            // Get the new view controller using segue.destination.
            let destinationViewController = segue.destination as! ResultViewController
            
            // Pass the selected object to the new view controller.
            destinationViewController.bodyMassIndexValue = calculateBrain.getBodyMassIndexValue()
            destinationViewController.bodyMassIndexAdvice = calculateBrain.getBodyMassIndexAdvice()
            destinationViewController.bodyMassIndexColor = calculateBrain.getBodyMassIndexColor()
        }
    }
}

