# Type Casting

Type casting is a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.

Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/

```bash
import UIKit

# Classes
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Human: Animal {
    func type() {
        print("Typing away...")
    }
}

class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under water.")
    }
}

# Variables
let jordan = Human(name: "Jordan Be")
let tomy = Human(name: "Tomy")
let dory = Fish(name: "Dory")
let nemo = Fish(name: "Nemo")
let number = 12
let nsNumber = NSNumber(1234)
let nsString = NSString("NSString")

# Type casting using array with some tips and tricks

# Only classes are excepted
let array = [jordan,nemo, tomy, dory] 
# Any type is expected
let arrayAny: [Any] = [jordan,nemo, tomy, dory, number, nsNumber, nsString]
# The number variable cannot be excepted here
let arrayAnyObject: [AnyObject] = [jordan,nemo, tomy, dory, nsNumber]
# Only NSObjects are expected here
let arrayNSObject: [NSObject] = [nsNumber, nsString]

func findFishes(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print(animal.name)
            let fish = animal as! Fish
            fish.breatheUnderWater()
            let fishToAnimal = fish as Animal
            print("FishToAnimal is now a type of Animal!")
            # fishToAnimal.breatheUnderWater() -> Impossible to access the Fish method
        }
    }
}

func findGeneric(from animals: [Animal]) {
    for animal in animals {
        if let human = animal as? Human {
            print("---- Human ----")
            print(human.name)
            human.type()
        }
        else if let fish = animal as? Fish {
            print("---- Fish ----")
            print(fish.name)
            fish.breatheUnderWater()
        }
        else {
            print("Error: Animal was not found!")
        }
    }
}

findFishes(from: array)
findGeneric(from: array)

```

# Results

For the _findFishes(from: array)_ method
```bash
Nemo
Breathing under water.
FishToAnimal is now a type of Animal!
Dory
Breathing under water.
FishToAnimal is now a type of Animal!
```

For the _findGeneric(from: array)_ method
```bash
---- Human ----
Jordan Be
Typing away...
---- Fish ----
Nemo
Breathing under water.
---- Human ----
Tomy
Typing away...
---- Fish ----
Dory
Breathing under water.
```