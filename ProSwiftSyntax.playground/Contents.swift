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

// Escaping closures

var queueClosures: [() -> Void] = []

func queueClosures(_ closure: @escaping () -> Void) {
    queueClosures.append(closure)
}

queueClosures ({
    print("Running closure 1")
})

queueClosures ({
    print("Running closure 2")
})
 
queueClosures ({
    print("Running closure 3")
})

func executeClosures() {
    for closure in queueClosures {
        closure()
    }
}

executeClosures()

// Autoclosures

func printTest(_ result: () -> Void) {
    print("Before")
    result()
    print("After")
}

print(printTest ({ print("Hello") }))

func autoPrintTest(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}

autoPrintTest(print("Hello"))

func autoEscapingPrintTest(_ result: @autoclosure @escaping () -> Void) {
    print("Before")
    result()
    print("After")
}

autoEscapingPrintTest(print("Luis"))

// The match operator or  ~= operator

let range = 1...100
let i = 42

if range ~= i {
    print("Match")
}

let test1 = range.contains(i)
let test2 = range ~= i

// Error fundamentals

enum PasswordError: Error {
    case empty
    case short
    case obvious(message: String)
}

func encrypt(_ str: String, with password: String) throws -> String {
    
    if password == "12345" {
        throw PasswordError.obvious(message: "This password is too obvious")
    }
    let encrypted = password + str + password
    return String(encrypted.reversed())
}

func testCatch() {
    do {
        let encrypted = try encrypt("Secret", with: "12345")
        print(encrypted)
    } catch PasswordError.short {
        print("Password is too short")
    } catch PasswordError.empty {
        print("Password field is empty")
    } catch PasswordError.obvious(let message) {
        print("You password is too obvious: \(message)")
    } catch {
        print("Encryptioned failed")
    }
}

testCatch()

// Error propagation

enum newPasswordError: Error {
    case empty
    case short
    case obvious
}

func functionA() {
    functionB()
}

func functionB() {
    do {
       try functionC()
    } catch {
        print("Error \(error)")
    }
}

func functionC() throws {
    throw newPasswordError.short
}

functionA()

// Throwing functions as parameters

enum Failure: Error {
    case broken
    case badNetwork(message: String)
}

func fetchRemote() throws -> String {
    throw Failure.badNetwork(message: "Firewall Block Port.")
}

func fetchLocal() -> String {
    return "Taylor"
}

func fetchUserData(using closure: () throws -> String) rethrows {
    do {
        let data = try closure()
        print("Userdata: \(data)")
    } catch Failure.badNetwork(message: let message) {
        print("Error: \(message)")
    } catch {
        print("Error: \(error)")
    }
}

fetchUserData(using: fetchLocal)
try fetchUserData(using: fetchRemote)
