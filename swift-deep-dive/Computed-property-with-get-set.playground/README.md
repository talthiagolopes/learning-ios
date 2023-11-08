# Computed properties with get and set methods

In addition to stored properties, classes, structures, and enumerations can define computed properties, which don’t actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.

Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Computed-Properties

```bash
import UIKit

struct Weather {
    // Normal property
    var temperature: Double = 22.4333

    # HINT: Is not possible to use 'let' for computed properties :)
    # HINT2: It is possible to set a new value for the computed property just in case of using set declaration as below
    var temperatureString: String {
        get {
            return String(format: "%.1f", temperature)
        }
        set {
            print("New temperature value can be accessed from here \(newValue)")
            temperature = Double(newValue)!
        }
    }
}

var weather = Weather()

print(weather.temperature)        #22.43
print(weather.temperatureString)  #22.4 - Trigger the get block

weather.temperatureString = "38.34" # Trigger to the set block
# New temperature value can be accessed from here 38.34"

print(weather.temperature)        #38.34
print(weather.temperatureString)  #38.3 - Trigger to the get block

```