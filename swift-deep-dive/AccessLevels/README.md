# Access Levels

You can assign specific access levels to individual types (classes, structures, and enumerations), as well as to properties, methods, initializers, and subscripts belonging to those types. Protocols can be restricted to a certain context, as can global constants, variables, and functions.

Keep reading https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/


Reference Git repository: https://github.com/londonappbrewery/SwiftAccessLevels

## main class
The main class has the responsability to call the A, B and AnotherClassInTheSameFile Classes

```bash
import Foundation

let aFile = AFile()

aFile.methodA()
# aFile.methodB() - Impossible : 'methodB' is inaccessible due to 'private' protection level
aFile.anInternalProperty

let bFile = BFile()

```

## A class
The A class has the responsability to access step by step of variable levels with the status if is possible or not, and why not. The AnotherClassInTheSameFile class has been created in order to ilustrate the variable from outside the scope.

```bash
import Foundation

class AFile {
    
    # Global variables, also called class properties.
    private var aPrivateProperty = "private property"
    
    fileprivate var aFilePrivateProperty = "fileprivate property"
    
    var anInternalProperty = "internal property"
    
    func methodA () {
        
        var aLocalVariable = "local variable"
        
        # Step 1. Try to print aLocalVariable Here - Possible
        //print("\(aLocalVariable) printed from methodA in AFile")
        
        # Step 3. Try to print aPrivateProperty Here - Possible
        //print("\(aPrivateProperty) printed from methodA in AFile")
        
        # Step 6. Try to print aFilePrivateProperty Here - Possible
        //print("\(aFilePrivateProperty) printed from methodA in AFile")
        
        # Step 9. Try to print anInternalProperty Here - Possible
        //print("\(anInternalProperty) printed from methodA in AFile")
    }
    
    private func methodB () {
        
        # Step 2. Try to print aLocalVariable Here - Impossible: Cannot find 'aLocalVariable' in scope
        //print("\(aLocalVariable) printed from methodB in AFile")
        
        # Step 4. Try to print aPrivateProperty Here - Possible
        //print("\(aPrivateProperty) printed from methodB in AFile")
    }
    
}

class AnotherClassInTheSameFile {
    
    init() {
        print("Init AnotherClassInTheSameFile")
        
        # Step 5. Try to print aPrivateProperty Here - Impossible: 'aPrivateProperty' is inaccessible due to 'private' protection level
        //print("\(AFile().aPrivateProperty) printed from init method in AnotherClassInTheSameFile")
        
        # Step 7. Try to print aFilePrivateProperty Here - Possible
        //print("\(AFile().aFilePrivateProperty) printed from init method in AnotherClassInTheSameFile")
    }
}

```

## B class
The B class has the responsability to access step by step of variable levels with the status if is possible or not, and why not
g
```bash
import Foundation

class BFile {
    
    init() {
        # Step 8. Try to print aFilePrivateProperty Here - Impossible:'aFilePrivateProperty' is inaccessible due to 'fileprivate' protection level
        //print("\(AFile().aFilePrivateProperty) printed from init method in BFile")
        
        # Step 10. Try to print anInternalProperty Heres - Possible
        //print("\(AFile().anInternalProperty) printed from init method in BFile")
    }
    
}

```