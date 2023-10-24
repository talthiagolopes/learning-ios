//
//  Item.swift
//  Todoey
//
//  Created by Thiago Américo Lopes on 23/10/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

class Item : Codable {
    
    init(title: String, selected: Bool) {
        self.title = title
        self.selected = selected
    }
    
    var title: String
    var selected: Bool
}
