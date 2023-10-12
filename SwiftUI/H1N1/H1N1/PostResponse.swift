//
//  PostResponse.swift
//  H1N1
//
//  Created by Thiago Américo Lopes on 9/10/2023.
//

import Foundation

struct PostResponse: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    
    let objectID: String
    let title: String
    let points: Int
    let url: String
}
