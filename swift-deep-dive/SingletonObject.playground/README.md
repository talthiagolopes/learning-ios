
# Singleton

You use singletons to provide a globally accessible, shared instance of a class.

Keep reading https://developer.apple.com/documentation/swift/managing-a-shared-resource-using-a-singleton

That is a good option for solutuions like the [UserDefaults](../UserDefaults.playground). There are many programming languages that provide similar concepts, in case you are not familiary with it, as Java developer I strongly suggest you research all bout OOP (Object-oriented programming).

## Singleton
The same space in memory is gonna be sharing the reference of the current object.

```bash
import UIKit

class UserDefaultsSingleton {
    
    var string = "UserDefaultsSingleton"
    
    static let standard = UserDefaultsSingleton()
}

let myUser = UserDefaultsSingleton.standard
myUser.string = "myUser"

let yourUser = UserDefaultsSingleton.standard
print(yourUser.string)  # myUser

class MyUserSingleton {
    init() {
        UserDefaultsSingleton.standard.string = "MyUserSingleton"
    }
}

class YourUserSingleton {
    init() {
        print(UserDefaultsSingleton.standard.string) # MyUserSingleton
    }
}

let my = MyUserSingleton()
let your = YourUserSingleton()
print(yourUser.string) # MyUserSingleton
```


## Without Singleton
It means always a new object is gonna be created for each object in different from memory parts.

```bash
import UIKit

class UserDefaultsWithoutSingleton {
    
    var string = "UserDefaults--Without--Singleton"
}

let myUserWithoutSingleton = UserDefaultsWithoutSingleton()
myUserWithoutSingleton.string = "myUserWithoutSingleton";

let yourUserWithoutSingleton = UserDefaultsWithoutSingleton()
print(yourUserWithoutSingleton.string) # UserDefaults--Without--Singleton
```