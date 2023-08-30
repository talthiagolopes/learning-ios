//
//  WeatherManager.swift
//  Clima
//
//  Created by Thiago Américo Lopes on 29/08/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    // https://home.openweathermap.org
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=<<api key>>&&units=metric"
    
    func fetchWeather(_ cityName: String) {
        let url = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: url)
    }
    
    func performRequest(urlString:  String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            
            task.resume()
        }
    }
    
    func handle(data: Data?, response:  URLResponse?, error:  Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let dataReturn = data {
            let dataReturnString = String(data: dataReturn, encoding: .utf8)
            print(dataReturnString!)
        }
        
        
    }
}
