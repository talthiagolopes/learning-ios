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
