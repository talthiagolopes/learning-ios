//
//  WeatherManager.swift
//  Clima
//
//  Created by Thiago Américo Lopes on 29/08/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherModel: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    // https://home.openweathermap.org
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=<<api key>>&&units=metric"
    
    func fetchWeather(_ cityName: String) {
        let url = "\(weatherURL)&q=\(cityName)"
        performRequest(with: url)
    }
    
    func performRequest(with urlString:  String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let responseData = data {
                    if let weatherModel =  self.parseJSON(responseData) {
                        delegate?.didUpdateWeather(weatherModel: weatherModel)
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
              
            return WeatherModel(conditionId: id, cityName: name, temperature: temp)
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
