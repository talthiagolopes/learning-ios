import UIKit

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

let jordan = Human(name: "Jordan Be")
let tomy = Human(name: "Tomy")
let dory = Fish(name: "Dory")
let nemo = Fish(name: "Nemo")
let number = 12
let nsNumber = NSNumber(1234)
let nsString = NSString("NSString")

let array = [jordan,nemo, tomy, dory]
let arrayAny: [Any] = [jordan,nemo, tomy, dory, number, nsNumber, nsString]
let arrayAnyObject: [AnyObject] = [jordan,nemo, tomy, dory, nsNumber]
let arrayNSObject: [NSObject] = [nsNumber, nsString]

func findFishes(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print(animal.name)
            let fish = animal as! Fish
            fish.breatheUnderWater()
            let fishToAnimal = fish as Animal
            print("FishToAnimal is now a type of Animal!")
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
