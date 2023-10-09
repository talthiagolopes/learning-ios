//
//  NetworkManager.swift
//  H1N1
//
//  Created by Thiago Américo Lopes on 9/10/2023.
//

import Foundation

struct NetworkManager {
    let ENDPOINT = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    func fectData() {
        if let url = URL(string: ENDPOINT) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let dataResponse = data {
                        do {
                            let results = try decoder.decode(PostResponse.self, from: dataResponse)
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
