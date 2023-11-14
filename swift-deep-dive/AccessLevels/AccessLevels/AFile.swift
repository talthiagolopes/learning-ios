//
//  AFile.swift
//  AccessLevels
//
//  Created by Thiago Américo Lopes on 10/11/2023.
//

import Foundation

class AFile {
    
    //Global variables, also called class properties.
    private var aPrivateProperty = "private property"
    
    fileprivate var aFilePrivateProperty = "fileprivate property"
    
    var anInternalProperty = "internal property"
    
    func methodA () {
        
        var aLocalVariable = "local variable"
        
        //Step 1. Try to print aLocalVariable Here - Possible
        //print("\(aLocalVariable) printed from methodA in AFile")
        
        //Step 3. Try to print aPrivateProperty Here - Possible
        //print("\(aPrivateProperty) printed from methodA in AFile")
        
        //Step 6. Try to print aFilePrivateProperty Here - Possible
        //print("\(aFilePrivateProperty) printed from methodA in AFile")
        
        //Step 9. Try to print anInternalProperty Here - Possible
        //print("\(anInternalProperty) printed from methodA in AFile")
    }
    
    private func methodB () {
        
        //Step 2. Try to print aLocalVariable Here - Impossible: Cannot find 'aLocalVariable' in scope
        //print("\(aLocalVariable) printed from methodB in AFile")
        
        //Step 4. Try to print aPrivateProperty Here - Possible
        //print("\(aPrivateProperty) printed from methodB in AFile")
    }
    
}

class AnotherClassInTheSameFile {
    
    init() {
        
        print("Init AnotherClassInTheSameFile")
        
        //Step 5. Try to print aPrivateProperty Here - Impossible: Cannot find 'aPrivateProperty' in scope
        //print("\(aPrivateProperty) printed from init method in AnotherClassInTheSameFile")
        
        //Step 7. Try to print aFilePrivateProperty Here - Impossible: Cannot find 'aFilePrivateProperty' in scope
        //print("\(aFilePrivateProperty) printed from init method in AnotherClassInTheSameFile")
        
    }
}






