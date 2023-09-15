let myOptional: String?

myOptional = nil

// 1. Force Unwrapping
//let text1: String = myOptional!

// 2. Check for nil value
if (myOptional !=  nil) {
    let text: String = myOptional!
    print("myOptional \(text) is not null")
} else {
    print("myOptional was found to be nil.")
}

// 3. Optional Binding
if let safeOptional = myOptional {
    let text3: String = safeOptional
    print(text3)
    print(safeOptional)
}

// 4. Nil Coalescing Operator
let text4: String = myOptional ?? "Default value"
print(text4)

struct MyOptionalStruct {
    var bla = 123456
    func ble() {
        print("Ble")
    }
}

let myOptionalStruct: MyOptionalStruct?

myOptionalStruct = nil
//myOptionalStruct = MyOptionalStruct()

// 5. Optional Chaining
print(myOptionalStruct?.bla)
print(myOptionalStruct?.ble())
