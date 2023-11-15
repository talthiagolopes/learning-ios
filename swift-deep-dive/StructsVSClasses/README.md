# Structs vs. Classes 

Structures and classes are good choices for storing data and modeling behavior in your apps, but their similarities can make it difficult to choose one over the other.

Keep reading https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes

## Choosing Between Structures and Classes

| STRUCT                        | CLASS                        |
|-------------------------------|------------------------------|
| Simpler                       | Has inheritance              |
| Faster                        | Works with objective-C codde |
| Deep copies                   |                              |
| True immutability             |                              |
| No memory leaks               |                              |
| Threadsafe                    |                              |


## main

```bash
import Foundation

var structCar = StructVehicle(name: "Ferrari", color: "Red")

var anotherStructCar =  structCar

anotherStructCar.name = "Purche"

print("Car name = \(structCar.name)") # Ferrari
structCar.reverseName()
print("Car reversed name = \(structCar.name)") # irarreF
print("AnotherCar name = \(anotherStructCar.name)") # Purche
anotherStructCar.reverseName()
print("anotherStructCar reversed name = \(anotherStructCar.name)") # ehcruP

print("\n ********************************* \n")

let classCar = ClassVehicle(name: "Ferrari", color: "Red")

var anotherClassCar =  classCar

anotherClassCar.name = "Purche"

print("Car name = \(classCar.name)") # Purche
classCar.reverseName()
print("Car reversed name = \(classCar.name)") # ehcruP
print("AnotherCar name = \(anotherClassCar.name)") # ehcruP
anotherClassCar.reverseName()
print("anotherStructCar reversed name = \(anotherClassCar.name)") # Purche

```

## Struct

```bash
import Foundation

struct StructVehicle {
    var name: String
    var color: String
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}
```

## Class

```bash
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

```