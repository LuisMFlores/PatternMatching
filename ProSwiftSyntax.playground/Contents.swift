import UIKit
import Foundation

// Variadic functions

// Not variadic
func notVariadicAdd(numbers: [Int]) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

notVariadicAdd(numbers: [1,2,3,4,5])

func variadicAdd(numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

variadicAdd(numbers: 1,2,3,4,5)

// Closures with parameters

let greetPerson = { (name: String) in
    print("Hello \(name)!")
}

