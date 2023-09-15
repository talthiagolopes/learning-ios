protocol CanFly {
    func fly()
}

protocol CanEat {
    func eat()
}

class Bird {
    func layEgg() {
        print("The bird makes a new bird in a shell.")
    }
}

class Eagle: Bird, CanFly, CanEat {
    func eat() {
        print("The eagle eats a lot of kind animals into the nature.")
    }
    
    func fly() {
        print("The eagle flaps its wings and lifts off into the sky.")
    }
    
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through the water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        print("flyingMuseum struct -> flyingDemo func")
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
}

let timaoEagle = Eagle()
timaoEagle.soar()
timaoEagle.eat()
timaoEagle.fly()
timaoEagle.layEgg()

let penguin = Penguin()
let plane = Airplane()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: plane)
museum.flyingDemo(flyingObject: timaoEagle)
