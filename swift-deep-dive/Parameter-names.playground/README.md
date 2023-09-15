# Parameter names

Swift’s unified function syntax is flexible enough to express anything from a simple C-style function with no parameter names to a complex Objective-C-style method with names and argument labels for each parameter..

Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/

```bash
import UIKit

func parameterName(externalLabel internalValue: String) {
    print("It is NOT possible to access the 'externalLabel' argument here")
    print("It is possible to access the 'internalValue' argument: \(internalValue)")
}

func parameterName2(_ internalValue: String) {
    print("It is possible to access the 'internalValue' argument value: \(internalValue)")
}

func parameterNam3(with internalValue: String) {
    print("It is possible to access the 'internalValue' argument value: \(internalValue)")
}

parameterName(externalLabel: "External value")
parameterName2("Internal value")
parameterNam3(with: "Internal value with")

```