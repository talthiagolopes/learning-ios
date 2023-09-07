# Control Flow + TDD

Swift provides a for-in loop that makes it easy to iterate over arrays, dictionaries, ranges, strings, and other sequences. Swift also provides defer statements, which wrap code to be executed when leaving the current scope.
Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/

TDD reference: https://clean-swift.com/step-by-step-walkthrough-of-ios-test-driven-development-in-swift/

## Loop examples
```bash
for anyType in arrayAnyType {}
for number in 1..<10 {}
for number in 1..10 {}
for String in String {} # It is be looping for each character
while condition {}
```

## Technical challenge
```bash
func fibonacci(n: Int) -> [Int] {
    
    var n0 = 0
    var n1 = 1
    var n2 = 0
    var results = [n0,n1]
    
    for index in 2..<n {
        n2 = n0 + n1
        results.append(n2)
        n0 = n1
        n1 = n2
    }
    print(results)
    return results
}

# TDD: Test Driven Development
func testFibonacciPosition5() {
    
    let fibonacciPosition5Value = 3
    
    let results = fibonacci(n: 7) #[0, 1, 1, 2, 3, 5, 8]
    
    let isValid = results[4] == fibonacciPosition5Value
    
    if isValid {
        print("Pass")
    }
    else {
        print("Fail - expected: \(fibonacciPosition5Value), got: \(results[4])")
    }
}

func testFibonacciSequenceWihtin10InitialNumbers() {
    let fibonacciSequence = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34] #[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    
    let results =  fibonacci(n: 10)
    
    var isValid = true
    
    for index in 0..<fibonacciSequence.count {
        if fibonacciSequence[index] != results[index] {
            isValid = false
            break
        }
    }
    
    if isValid {
        print("Pass")
    }
    else {
        print("Fail - expected: \(fibonacciSequence), got: \(results)")
    }

}

testFibonacciPosition5() #Pass
testFibonacciSequenceWihtin10InitialNumbers() #Pass

```