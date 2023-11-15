//
//  StructVehicle.swift
//  StructsVSClasses
//
//  Created by Thiago Américo Lopes on 14/11/2023.
//

import Foundation

struct StructVehicle {
    var name: String
    var color: String
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}
