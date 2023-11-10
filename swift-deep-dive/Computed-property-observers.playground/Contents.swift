import UIKit


// Computed property with property observers
var temperature: String {
    willSet {
        print("*** willSet")
        print("Current value -> temperature: \(temperature)")
        print("newValue: \(newValue)")
    }
    didSet {
        print("*** didSet")
        print("oldValue: \(oldValue)")
        print("New Value -> temperature: \(temperature)")
    }
}

temperature = "It's freezing today in Australia, isn't true xD"
