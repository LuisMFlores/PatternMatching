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

// Functions with closures as parameters

func runSomeClosure(_ closure: (String) -> Void) {
    closure("Luis")
}

runSomeClosure(greetPerson)

// Closure capturing

func testCapture() -> () -> Void {
    var counter = 0
    return {
        counter += 1
        print(counter)
    }
}

let test = testCapture()
test()
test()
test()

// Closure shorthand syntax

let filterNameClosure: (String) -> Bool = {
    return $0.hasPrefix("Avril")
}

let celebritiesName = ["Michael Jackson", "Avril Lavigne", "Michael Jordan"]

let result1 = celebritiesName.filter { (name) -> Bool in
    if name.hasPrefix("Michael") {
        return true
    } else {
        return false
    }
}

let result2 = celebritiesName.filter { name -> Bool in
    if name.hasPrefix("Michael") {
        return true
    } else {
        return false
    }
}

let result3 = celebritiesName.filter { name -> Bool in
    return name.hasPrefix("Michael")
}

let result4 = celebritiesName.filter { name -> Bool in
    name.hasPrefix("Michael")
}

let result5 = celebritiesName.filter ({
    $0.hasPrefix("Michael")
})

let result6 = celebritiesName.filter { $0.hasPrefix("Michael")}

// Functions as closures

let words = ["1989", "Luis", "Manuel"]
let input = "Luis"

let containsClosure:(String) -> Bool = {
    return $0 == "Luis"
}

words.contains(where: containsClosure)
words.contains(where: input.contains)

let number = [1,2,3,4,5]
number.reduce(0, -)
