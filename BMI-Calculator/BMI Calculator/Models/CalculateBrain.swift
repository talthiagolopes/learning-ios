//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Thiago Américo Lopes on 16/08/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    
    var  bodyMassIndex: BodyMassIndex?
    
   mutating func calculateBodyMassIndex(height: Float, weight:  Float) {
        let bodyMassIndexValue = weight / pow(height, 2)
       
       if (bodyMassIndexValue < 18.5) {
           self.bodyMassIndex = BodyMassIndex(value: bodyMassIndexValue, advice: "Eat more pies", color: UIColor.blue)
       } else if (bodyMassIndexValue < 24.9) {
           self.bodyMassIndex = BodyMassIndex(value: bodyMassIndexValue, advice: "Fit as a fiddle", color: UIColor.green)
       } else {
           self.bodyMassIndex = BodyMassIndex(value: bodyMassIndexValue, advice: "Eat less pies", color: UIColor.orange)
       }
   }
    
    func getBodyMassIndexValue() -> String {
        return String(format: "%.1f", self.bodyMassIndex?.value ?? 0.0)
    }
    
    func getBodyMassIndexAdvice() -> String {
        return self.bodyMassIndex?.advice ?? "No advice found"
    }
    
    func getBodyMassIndexColor() -> UIColor  {
        return self.bodyMassIndex?.color ?? UIColor.blue
    }
}
