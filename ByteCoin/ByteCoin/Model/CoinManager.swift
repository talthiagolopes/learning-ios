//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    //https://www.coinapi.io -> Pricing -> Free
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "<<api key>>"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getPrice(for currency: String) {
        print(currency)
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let responseData = data {
                    
                    let responseDataString = String.init(data: responseData, encoding: .utf8)
                    print(responseDataString!)
                    
                    if let rate = self.parseJSON(responseData) {
                        print("RAAAAAATE \(rate)")
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> Double? {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(CoinData.self, from: coinData)

                return decodedData.rate
            } catch {
                return nil
            }
        }
    
}
