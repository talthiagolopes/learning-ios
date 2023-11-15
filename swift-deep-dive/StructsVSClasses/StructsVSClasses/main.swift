//
//  main.swift
//  StructsVSClasses
//
//  Created by Thiago Américo Lopes on 14/11/2023.
//

import Foundation

var structCar = StructVehicle(name: "Ferrari", color: "Red")

var anotherStructCar =  structCar

anotherStructCar.name = "Purche"

print("Car name = \(structCar.name)")
structCar.reverseName()
print("Car reversed name = \(structCar.name)")
print("AnotherCar name = \(anotherStructCar.name)")
anotherStructCar.reverseName()
print("anotherStructCar reversed name = \(anotherStructCar.name)")

print("\n ********************************* \n")

let classCar = ClassVehicle(name: "Ferrari", color: "Red")

var anotherClassCar =  classCar

anotherClassCar.name = "Purche"

print("Car name = \(classCar.name)")
classCar.reverseName()
print("Car reversed name = \(classCar.name)")
print("AnotherCar name = \(anotherClassCar.name)")
anotherClassCar.reverseName()
print("anotherStructCar reversed name = \(anotherClassCar.name)")
