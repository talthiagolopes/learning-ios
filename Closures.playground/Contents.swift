import UIKit

// Closures -  Two examples in order to understand step by step

// Exemple 1 - Step 01
func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

func multiply(num1: Int, num2: Int) -> Int {
    return num1 * num2
}

calculator(n1: 2, n2:  5, operation: add)
calculator(n1: 2, n2:  5, operation: multiply)

// Exemple 1 - Step 02
calculator(n1: 2, n2:  5, operation: { (num1, num2) in num1 + num2 })
calculator(n1: 2, n2:  5, operation: { (num1, num2) in num1 * num2 })

/* { (parameter) -> return type in statements } */

// Exemple 1 - Step 03
calculator(n1: 2, n2:  5, operation: {$0 + $1})
calculator(n1: 2, n2:  5, operation: {$0 * $1})

// Exemple 1 - Step 04 (Final
calculator(n1: 2, n2:  5) {$0 + $1}
calculator(n1: 2, n2:  5) {$0 * $1}


// Exemple 2 - Converting the array from Int to String and adding plus one for each
let array = [1,2,3,4,5,6]

array.map{"\($0 + 1)"}
