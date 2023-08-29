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
        print(url)
    }
}
