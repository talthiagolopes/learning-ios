//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        print("searchPressed")
        setEndEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        setEndEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        
        if let cityName = searchTextField.text {
            weatherManager.fetchWeather(cityName)
        }
       
        searchTextField.text = ""

        return true
    }
    
    func setEndEditing(_ endEditing: Bool) {
        searchTextField.endEditing(endEditing)
    }
    
    func didUpdateWeather(weatherModel: WeatherModel) {
        print("didUpdateWeather")
        print(weatherModel.temperature)
        print(weatherModel.temperatureString)
    }
    
    func didFailWithError(error: Error) {
        print("didFailWithError")
        print(error)
    }
    
    

}

