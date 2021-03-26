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

// Map

func lengthOf(strings: [String]) -> [Int] {
    var results = [Int]()
    for string in strings {
        results.append(string.count)
    }
    return results
}

print(lengthOf(strings: ["Luima", "Merlin"]))

func mapLengthOf(strings: [String]) -> [Int] {
    strings.map { $0.count }
}

print(mapLengthOf(strings: ["Luima", "Merlin"]))

let fruits = ["Apple", "Cherry", "Orange", "Pineapple"]
let upperCasedFruits = fruits.map { $0.uppercased() }
print(upperCasedFruits)

let scores = [90,100,84]
let formatted = scores.map {"Your score was \($0)"}
print(formatted)

let passOrFail = scores.map { $0 > 85 ? "You passed!" : "You Failed!"}
print(passOrFail)

// CompactMap

let albums: [String?] = ["Fearless", nil, "Speak now", nil, "Red"]

let albumsResults = albums.compactMap { $0 }
print(albumsResults)

let newScores = ["100", "90", "Fish", "85"]
print(newScores.compactMap { Int($0) } )

let files = (1...10).compactMap { try? String(contentsOfFile: "some-file\($0)") }
let view = UIView()
let labels = view.subviews.compactMap { $0 as? UILabel }

// FlatMap

let numbers = [[1,2,3], [4,5,6], [7,8,9]]
print(numbers.flatMap { $0 })

// Filters

let fibonacciNumbers = [1,1,2,3,5,8,13,21,34,55]
let evenFibonnaciNum = fibonacciNumbers.filter { $0 % 2 == 0 }
print(evenFibonnaciNum)

let names = ["Michael Jackson", "Avril Lavigne", "Michael Jordan"]
let filteredNames = names.filter { $0.hasPrefix("Michael")}
print(filteredNames)

// Reduce

let reducedFibonnaciNumbers = fibonacciNumbers.reduce(0, +)
print(reducedFibonnaciNumbers)

let newResults = fibonacciNumbers.reduce("") { $0 + String($1)}
print(newResults)

let luimaChar = ["l", "u", "i", "m", "a"]
print(luimaChar.reduce(""){ $0 + $1})

let newNames = ["Taylor", "Paul", "Adele"]
print(newNames.reduce(0){ $0 + $1.count})

let ages = [18, 20, 15, 22]
let areAgesOk = ages.reduce(true){$0 && ($1 >= 18)}
print(areAgesOk)

let otherAreAgesOk = ages.allSatisfy { $0 > 20}
print(otherAreAgesOk)

let multiArr = [[1,2,3], [4,5,6]]
let reduceToSingle = multiArr.reduce([]) { $0 + $1 }
print(reduceToSingle)

// Sort

let scoreStrings = ["100", "95", "85"]
let sortedStrings1 = scoreStrings.sorted()
print(sortedStrings1)

let scoreInts = scoreStrings.compactMap { Int($0) }
let sortedScoreInts = scoreInts.sorted()
print(sortedScoreInts)

struct SortPerson {
    var name: String
    var age: Int
}

let sortTaylor = SortPerson(name: "Taylor", age: 26)
let sortJustin = SortPerson(name: "Justin", age: 30)
let sortLuis = SortPerson(name: "Luis", age: 29)

let peopleToBeSorted = [sortTaylor, sortJustin, sortLuis]
let sortedPeopleByName = peopleToBeSorted.sorted { $0.name < $1.name }
let sortedPeopleByAge = peopleToBeSorted.sorted { $0.age < $1.age }
sortedPeopleByName.map { print($0.name)}
sortedPeopleByAge.map { print($0.name)}

struct SortPersonComparable {
    var name: String
    var age: Int
}

extension SortPersonComparable: Comparable {
    
    static func < (lhs: SortPersonComparable, rhs: SortPersonComparable) -> Bool {
        lhs.age < rhs.age
    }
    
    static func == (lhs: SortPersonComparable, rhs: SortPersonComparable) -> Bool {
        lhs.name == rhs.name && lhs.age == rhs.age
    }
    
}

let sortComparableTaylor = SortPersonComparable(name: "Taylor", age: 26)
let sortComparableJustin = SortPersonComparable(name: "Justin", age: 30)
let sortComparableLuis = SortPersonComparable(name: "Luis", age: 29)

print([sortComparableJustin, sortComparableTaylor, sortComparableLuis].sorted())

// Reverse sorting

let namesToReverse = ["Bravo", "Paul", "Adele", "Justin"]
let namesArr = Array(namesToReverse.sorted().reversed())
print("Names arr is \(namesArr.first)")
namesArr.map { print($0)}
