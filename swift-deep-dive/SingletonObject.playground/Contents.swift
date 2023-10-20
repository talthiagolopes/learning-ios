import UIKit

print("---- Starting Without Singleton")
class UserDefaultsWithoutSingleton {
    
    var string = "UserDefaults--Without--Singleton"
}

let myUserWithoutSingleton = UserDefaultsWithoutSingleton()
myUserWithoutSingleton.string = "myUserWithoutSingleton";

let yourUserWithoutSingleton = UserDefaultsWithoutSingleton()
print(yourUserWithoutSingleton.string)

print("---- Starting Singleton")
class UserDefaultsSingleton {
    
    var string = "UserDefaultsSingleton"
    
    static let standard = UserDefaultsSingleton()
}

let myUser = UserDefaultsSingleton.standard
myUser.string = "myUser"

let yourUser = UserDefaultsSingleton.standard
print(yourUser.string)

class MyUserSingleton {
    init() {
        UserDefaultsSingleton.standard.string = "MyUserSingleton"
    }
}

class YourUserSingleton {
    init() {
        print(UserDefaultsSingleton.standard.string)
    }
}

let my = MyUserSingleton()
let your = YourUserSingleton()
print(yourUser.string)
