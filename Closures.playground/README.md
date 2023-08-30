# Closures

Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/

```bash
import UIKit

# Closures -  Two examples in order to understand step by step

# E.g: 1 - Step 01
func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

func multiply(num1: Int, num2: Int) -> Int {
    return num1 * num2
}

calculator(n1: 2, n2:  5, operation: add)      #2
calculator(n1: 2, n2:  5, operation: multiply) #7

# E.g: 1 - Step 02
calculator(n1: 2, n2:  5, operation: { (num1, num2) in num1 + num2 }) #2
calculator(n1: 2, n2:  5, operation: { (num1, num2) in num1 * num2 }) #7

# { (parameters) -> return type in statements }

# E.g: 1 - Step 03
calculator(n1: 2, n2:  5, operation: {$0 + $1}) #2
calculator(n1: 2, n2:  5, operation: {$0 * $1}) #7

# E.g: 1 - Step 04 (Final
calculator(n1: 2, n2:  5) {$0 * $1} #2
calculator(n1: 2, n2:  5) {$0 + $1} #7


# E.g: 2 - Converting the array from Int to String and adding plus one for each
let array = [1,2,3,4,5,6] # (6 elements) [1, 2, 3, 4, 5, 6]

array.map{"\($0 + 1)"}    # (6 elements) ["2", "3", "4", "5", "6", "7"]

```