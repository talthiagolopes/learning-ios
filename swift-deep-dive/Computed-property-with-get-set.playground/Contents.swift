import UIKit

struct Weather {
    // Normal property
    var temperature: Double = 22.4333

    // Computed property with get and set
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

print(weather.temperature)
print(weather.temperatureString)

weather.temperatureString = "38.34"

print(weather.temperature)
print(weather.temperatureString)
