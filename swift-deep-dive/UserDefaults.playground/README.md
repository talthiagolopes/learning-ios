
# UserDefaults

The UserDefaults class provides a programmatic interface for interacting with the defaults system. The defaults system allows an app to customize its behavior to match a user’s preferences.

 Important point: Should not be used as database, it can impact negatively the app performance

Keep reading https://developer.apple.com/documentation/foundation/userdefaults

```bash
import  UIKit

let  defaults  =  UserDefaults.standard

# Persiste
defaults.set("Savings",  forKey:  "RandomString")
defaults.set(6.5,  forKey:  "RadomFloat")
defaults.set(["name":  "Thiago",  "age":  "32"],  forKey:  "RandomDictionary")
defaults.set(["Bla",  "Ble",  "Bli"],  forKey:  "RandomArray")

# Retrive
let  randomString  =  defaults.string(forKey:  "RandomString") # "Savings"
let  randomFloat  =  defaults.float(forKey:  "RadomFloat") # 6.5
let  randomDictionary  =  defaults.dictionary(forKey:  "RandomDictionary") # Dictionary of 2 (String, Any) elements
let  randomArray  =  defaults.array(forKey:  "RandomArray") as! [String] # Array of 3 String elements
```