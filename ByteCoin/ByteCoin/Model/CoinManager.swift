//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(currency: String, rate: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
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
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let responseData = data {
                    
                    let responseDataString = String.init(data: responseData, encoding: .utf8)
                    print(responseDataString!)
                    
                    if let coinData = self.parseJSON(responseData) {
                        
                        let rateString = String(format: "%.2f", coinData.rate)
                        
                        self.delegate?.didUpdateCoin(currency: coinData.asset_id_quote, rate: rateString)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinData? {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(CoinData.self, from: coinData)

                return decodedData
            } catch {
                self.delegate?.didFailWithError(error: error)
                return nil
            }
        }
    
}
