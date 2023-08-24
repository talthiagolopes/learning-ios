//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var chooseSplitLabel: UILabel!
    
    var tipAmount: Float = 0.1
    var chooseSplitValue: Int = 2;
    var billValue: Float = 0.0
    var totalResult: Float = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        let buttonPressed  = sender.currentTitle!

        billTextField.endEditing(true)
        
        if buttonPressed == "0%" {
            zeroPercentButton.isSelected = true
            activePercentButton(isZeroPercent: true)
            tipAmount = convertTipAmountToPercentage(tipAmount: 0)
        } else if buttonPressed == "10%" {
            activePercentButton(isTenPercent: true)
            tipAmount = convertTipAmountToPercentage(tipAmount: 10)
        } else {
            activePercentButton(isTwentyPercent: true)
            tipAmount = convertTipAmountToPercentage(tipAmount: 20)
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print("stepperValueChanged")
        chooseSplitLabel.text = String(format: "%.0f", sender.value)
        chooseSplitValue = Int(sender.value)
       
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("calculatePressed")
    
        if let billValueInput = Float(billTextField.text ?? "0") {
            billValue = billValueInput
        }
        
        if billValue > 0.0 {
            totalResult = (self.billValue + (self.billValue * self.tipAmount)) / Float(Double(self.chooseSplitValue))
            print(totalResult)
        }
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "goToResults" {
            
            // Get the new view controller using segue.destination.
            let resultsViewController =  segue.destination as! ResultsViewController
            
            // Pass the selected object to the new view controller.
            resultsViewController.totalValue =  String(format: "%.2f", totalResult)
            resultsViewController.tipPercentage = convertTipPercentageToAmount(tipPercentage: tipAmount)
            resultsViewController.numberOfPeople = self.chooseSplitValue
        }
    }

    
    func activePercentButton(isZeroPercent: Bool = false, isTenPercent: Bool = false, isTwentyPercent: Bool =  false)   {
        zeroPercentButton.isSelected = isZeroPercent
        self.tenPercentButton.isSelected =  isTenPercent
        self.twentyPercentButton.isSelected = isTwentyPercent
    }
    
    func convertTipAmountToPercentage(tipAmount: Int) -> Float {
        if tipAmount > 0 {
            return Float(tipAmount) / 100
        }
        return 0.0
    }
    
    func convertTipPercentageToAmount(tipPercentage: Float) -> Int {
        if tipPercentage > 0.0 {
            return Int(tipPercentage * 100)
        }
        return 0
    }
}

