//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Thiago Américo Lopes on 15/08/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bodyMassIndexLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bodyMassIndexValue : String?
    var bodyMassIndexAdvice : String?
    var bodyMassIndexColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bodyMassIndexLabel.text = self.bodyMassIndexValue
        adviceLabel.text  = self.bodyMassIndexAdvice
        view.backgroundColor = bodyMassIndexColor
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
