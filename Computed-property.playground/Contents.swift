import UIKit

struct Weather {
    // Normal property
    let temperature: Double = 22.43

    // Computed property
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
}

let weather = Weather()

print(weather.temperature)
print(weather.temperatureString)
