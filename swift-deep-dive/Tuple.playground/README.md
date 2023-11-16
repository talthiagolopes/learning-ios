# Tuple Type

A tuple type is a comma-separated list of types, enclosed in parentheses.

Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/types/#Tuple-Type

```bash
import  Foundation

let tuple1 = ("Thiago1", 31)

let tuple2 = (name: "Thiago2", age: 32)

let tuple3: (name: String, age: Int) = (name: "Thiago3", age: 33)

print("\(tuple1.0) is \(tuple1.1) years old.") # Thiago1 is 31 years old.
print("\(tuple2.name) is \(tuple2.age) years old.") # Thiago2 is 32 years old.
print("\(tuple3.name) is \(tuple3.age) years old.") # Thiago3 is 33 years old.


```