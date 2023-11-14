//
//  main.swift
//  AccessLevels
//
//  Created by Thiago Américo Lopes on 10/11/2023.
//

import Foundation

let aFile = AFile()

aFile.methodA()
//aFile.methodB() - Impossible : 'methodB' is inaccessible due to 'private' protection level
let anotherClassInTheSameFile = AnotherClassInTheSameFile()

let bFile = BFile()


