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
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=5a257e91f0334f9ac96f4766d4f60d7d&&units=metric"
    
    func fetchWeather(_ cityName: String) {
        let url = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: url) 
    }
    
    func performRequest(urlString:  String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let responseData = data {
                    self.parseJSON(weatherData: responseData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
}
