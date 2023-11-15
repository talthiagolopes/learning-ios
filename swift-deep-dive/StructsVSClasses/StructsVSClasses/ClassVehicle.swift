//
//  ClassVehicle.swift
//  StructsVSClasses
//
//  Created by Thiago Américo Lopes on 14/11/2023.
//

import Foundation

class ClassVehicle {
    
    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    func reverseName() {
        self.name = String(self.name.reversed())
    }
}
