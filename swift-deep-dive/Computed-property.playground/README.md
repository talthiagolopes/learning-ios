# Computed properties

Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.

Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/

```bash

import UIKit

struct Weather {
    # Normal property
    let temperature: Double = 22.43

    # Computed property: HINT: Is not possible to use 'let' for computed properties :)
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
}

let weather = Weather()

print(weather.temperature)        #22.43
print(weather.temperatureString)  #22.4

```