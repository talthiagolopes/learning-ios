# Extensions

Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you don’t have access to the original source code (known as retroactive modeling)

Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions/

```bash

import UIKit

protocol CanFly {
    func fly()
}

extension CanFly {
    func fly() {
        print("Amazing! We can have a default implementation and make it doesn't required!")
    }
}

class Eagle: CanFly {
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
}

struct Airplane: CanFly {
    func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
}

let eagle = Eagle()
eagle.soar() #The eagle glides in the air using air currents.
eagle.fly()  #Amazing! We can have a default implementation and make it doesn't required!

let airplane = Airplane()
airplane.fly() #The airplane uses its engine to lift off into the air.

```