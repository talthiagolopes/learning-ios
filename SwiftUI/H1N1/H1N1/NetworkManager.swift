//
//  NetworkManager.swift
//  H1N1
//
//  Created by Thiago Américo Lopes on 9/10/2023.
//

import Foundation

class NetworkManager: ObservableObject {
    
    let ENDPOINT = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    @Published var posts = [Post]()
    
    func fectData() {
        if let url = URL(string: ENDPOINT) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let dataResponse = data {
                        do {
                            let results = try decoder.decode(PostResponse.self, from: dataResponse)
                            // Fix: Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
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
