//
//  WeatherData.swift
//  Clima
//
//  Created by Thiago Américo Lopes on 31/08/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

/* Note:
    May you need some specific attributes that hasn't been mapped here, even though
    the API is providing, please, just keep mapping as the examples below
 */

//Decodable, Codable = Decodable & Encodable
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
