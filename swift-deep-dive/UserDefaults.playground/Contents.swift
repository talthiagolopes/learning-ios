import UIKit

let defaults = UserDefaults.standard

defaults.set("Savings", forKey: "RandomString")
defaults.set(6.5, forKey: "RadomFloat")
defaults.set(["name": "Thiago", "age": "32"], forKey: "RandomDictionary")
defaults.set(["Bla", "Ble", "Bli"], forKey: "RandomArray")


let randomString = defaults.string(forKey: "RandomString")
let randomFloat = defaults.float(forKey: "RadomFloat")
let randomDictionary = defaults.dictionary(forKey: "RandomDictionary")
let randomArray = defaults.array(forKey: "RandomArray") as! [String]


