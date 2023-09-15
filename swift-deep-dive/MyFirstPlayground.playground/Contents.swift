import UIKit

//String interpolation
print("****** String interpolation")
print("Stract works like this one 10+2 I loved it!")
print("Stract works like this one (10+2) I loved it!")
print("Stract works like this one \(10+2) I loved it!")


//Variables
print("\n")
print("****** Variables")
var bla = "Hello, my first playground"
var a =  5
var b = 2

print(bla)
print("The value of 'a' is \(a)")
print("The value of 'b' is \(b)")
print("The sum of 'a' + 'b' = \(a + b)")

var c  = a
a = b
b = c
print("Switching a and b ...")
print("The value of 'a' is \(a)")
print("The value of 'b' is \(b)")


//Arrays
print("\n")
print("****** Arrays")
var numbers = [45, 73, 195, 53]
var results = [numbers[0] * numbers[1], numbers[1] * numbers[2], numbers[2] * numbers[3], numbers[3] * numbers[0]]
var computedNumbers = results

print(computedNumbers)

//Constants
print("\n")
print("****** Constants")

let con = 3

//con = 5

print(con)

//Random
print("\n")
print("****** Random")

print(Int.random(in: 1 ..< 3))

let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

var result = "";
for _ in 1...6 {
    result += alphabet[Int.random(in: 0...26)]
}

let password = result

let password2 = alphabet[Int.random(in: 0...26)] + alphabet[Int.random(in: 0...26)] + alphabet[Int.random(in: 0...26)] + alphabet[Int.random(in: 0...26)] + alphabet[Int.random(in: 0...26)] + alphabet[Int.random(in: 0...26)]
    
print(password)
print(password2)

//Functions and Variables type
print("\n")
print("****** Functions and Variables type")

var myString: String = "Hey"

func sayHello()  {
    print("Hello")
}

func sayHello2(message: String)  {
    print("Hello2 \(message)")
}

sayHello()
sayHello2(message: "My friend")
sayHello2(message: "My friend2")

func calculator() {
  let a = 3 //First input
  let b = 4 //Second input
  
  add(n1: a, n2: b)
  subtract(n1: a, n2: b)
  multiply(n1: a, n2: b)
  divide(n1: a, n2: b)
  
}


func add(n1: Int, n2: Int) {
    print(n1 + n2)
}

func subtract(n1: Int, n2: Int) {
    print(n1 - n2)
}

func multiply(n1: Int, n2: Int) {
    print(n1 * n2)
}

func divide(n1: Int, n2: Int) {
    print(Double(n1) / Double(n2))
}

calculator()


//Condition (If-Else Control Flow)
print("\n")
print("****** //Condition (If-Else Control Flow)")

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    print("Love score random value is: \(loveScore)")
    
    if loveScore > 80 {
        print("********* You love  each  other like Kanye loves Kell! *********")
    }
    else if  loveScore > 40 {
        print("**** You go together like Coke and Mentos! ****")
    }
    else {
        print("You will be forever  alone!")
    }
}

loveCalculator()
loveCalculator()
loveCalculator()

func isLeap(year: Int) {
    
    print("isLeap: Year \(year)")
    if year % 4 == 0 && year % 100 != 0 || year % 400 == 0 {
       print("YES")
    }
    else {
        print("isLeap: NO")
    }
}

isLeap(year: 1997)
isLeap(year: 1996)
isLeap(year: 1900)
isLeap(year: 2000)

print(" Switch **************************************************************")
func loveCalculator2() {
    let loveScore = Int.random(in: 0...100)
    
    print("Love score random value is: \(loveScore)")
    
    switch loveScore {
    case  81...100:
        print("********* You love  each  other like Kanye loves Kell! *********")
    case 41..<80:
        print("**** You go together like Coke and Mentos! ****")
    case ...49:
        print("** You will be forever  alone!")
    default:
        print("Error lovescore is out of range.")
    }
}

loveCalculator2()
loveCalculator2()
loveCalculator2()

func dayOfTheWeek(day: Int) {
    print("Day of the week: \(day)")
    switch day {
    case 1:
        print("Monday")
    case 2:
        print("Tuesday")
    case 3:
        print("Wednesday")
    case 4:
        print("Thursday")
    case 5:
        print("Friday")
    case 6:
        print("Saturday")
    case 7:
        print("Sunday")
    default:
        print("Error")
    }
}

dayOfTheWeek(day: 7)
dayOfTheWeek(day: 0)
dayOfTheWeek(day: 1)
dayOfTheWeek(day: 2)
dayOfTheWeek(day: 3)
dayOfTheWeek(day: 4)
dayOfTheWeek(day: 5)
dayOfTheWeek(day: 6)
dayOfTheWeek(day: 1)
dayOfTheWeek(day: 8)


//Dictionaries
print("\n")
print("****** Dictionaries)")

var stockTickers: [String: String] = [
    "APPL" : "Apple Inc",
    "HOG": "Harley-Davidson Inc",
    "BOOM": "Dynamic Materials",
    "HEINY": "Heineken",
    "BEN": "Franklin Resources Inc"
]

stockTickers["WORK"] = "Slack Technologies Inc"
stockTickers.updateValue("DMC Global Inc", forKey: "BOOM")


print(stockTickers["WORK"]!)
print(stockTickers["BOOM"]!)

//Optionals
print("\n")
print("****** Optionals)")

var optional: String?  = nil

if optional != nil {
    print(optional)
}

optional = "blabla"

print(optional)
print(optional!)


func highestScore(scores: [String: Int]) {
    print(scores.values.max()!)
}

highestScore(
    scores: [
    "Amy": 78,
    "James": 65,
    "Helen": 92
    ]
)


//Conversion
print("\n")
print("****** Conversion")

let aaa = 10
let bbb = 20

print(aaa / bbb)
print(Float(aaa / bbb))
print(Float(aaa) / Float(bbb))


// Structurs
print("\n")
print("****** Structurs")

struct User {
    let name: String
    var email: String?
    var followers: Int
    var isActive: Bool
    
    init(name: String, email: String, followers: Int, isActive: Bool) {
        self.name = name
        self.email = email
        self.followers =  followers
        self.isActive =  isActive
    }
    
    func logStatus() {
        if (self.isActive) {
            print("\(self.name) is working hard")
        }
        else {
            print("\(self.name) has left earth")
        }
    }
    
    func tellMeEverything() {
        print("Name: \(self.name)")
        print("email: \(self.email ?? "")")
        print("followers: \(self.followers)")
        print("isActive: \(self.isActive)")
    }
}

var newUser = User(name: "Richard", email: "", followers: 0, isActive: false)
newUser.logStatus()
newUser.tellMeEverything()



// Functions returning
print("\n")
print("****** Functions returning")

func getMyName(name: String) -> String {
    return "Your name is \(name)"
}

var mrEggs  = getMyName(name: "Mr eggs")
var blownAway = getMyName(name: "Blown away")

print(mrEggs)
print(blownAway)

func isOdd(n: Int) -> Bool {
    if (n % 2) > 0 {
        return true;
    }
    else  {
        return false;
    }
}
print(isOdd(n: 2))

// Immutability
print("\n")
print("****** Immutability")

struct Immutability {
    var nickName: String
    var age:  Int
    
    mutating func changeNickName() {
        nickName = "Gogo"
    }
}

func changeValue()  {
    var immutability = Immutability(nickName: "João", age: 10)
    
    immutability.changeNickName()
    print(immutability.nickName)
}

changeValue()
