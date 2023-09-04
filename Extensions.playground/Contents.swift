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
eagle.soar()
eagle.fly()

let airplane = Airplane()
airplane.fly()
