# Computed properties with get and set methods

Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.

Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Property-Observers

```bash
import UIKit

 # HINT: The observing properties require an initializer :)
var temperature: String = "How's the temperature going today?" {
    willSet {
        print("*** willSet")
        print("Current value -> temperature: \(temperature)") # How's the temperature going today?
        print("newValue: \(newValue)") # It's freezing today in Australia, isn't true xD
    }
    didSet {
        print("*** didSet") 
        print("oldValue: \(oldValue)") # How's the temperature going today?
        print("New Value -> temperature: \(temperature)") # temperature: It's freezing today in Australia, isn't true xD
    }
}

temperature = "It's freezing today in Australia, isn't true xD"

```