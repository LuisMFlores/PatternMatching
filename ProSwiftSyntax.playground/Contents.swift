import UIKit

// Basis switch

let name = "twostraws"

switch name {
case "bilbo":
    break
case "twostraws":
    break
default:
    break
}

// Validating two values

let newName = "twostraws"
let password = "fr0st1es"

switch (newName, password) {
case ("bilbo","bagg1n5"):
    print("Hello you")
case ("twostraws", "fr0st1es"):
    print("Hello Luis M.")
default:
    print("Hello Unknown person")
}

// Validating two values with a single tuple

let authenthication = (name: newName, password: password)

switch authenthication {
case ("bilbo","bagg1n5"):
    print("Hello you")
case ("twostraws", "fr0st1es"):
    print("Hello Luis M.")
default:
    print("Hello Unknown person")
}

// Partial Matches
// Swift will take first matching case it finds so ensure you look for the most specific case first
let newAuthentication = (name: "twostraws", password: "fr0st1es", ipAddress: "127.0.01")

switch newAuthentication {
case (_, _, _):
    print("You could be anybody")
case ("bilbo", "bagg1n5", _):
    print("Welcome Bilbo")
case ("twostraws", "fr0st1es", _):
    print("Hello Luis")
default:
    print("Who are you?")
}

// Partial Matching with Let

switch newAuthentication {
case ("bilbo", let password, _):
    print("Hello bilbo, password \(password)")
case (let internalName, let internalPassword, let internalIPAddress):
    print("Welcome \(internalName). Your password is \(internalPassword) with an ipAddress of \(internalIPAddress)")
default:
    print("Unkown")
}

// Pattern mamtching with calculated tuples

func fizzbuzz(withNumber number: Int) {
    var wordToprint = ""
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        wordToprint = "Fizz"
    case (false, true):
        wordToprint = "Buzz"
    case (true, true):
        wordToprint = "FizzBuzz"
    default:
        wordToprint = String(number)
    }
    print(wordToprint)
}

for i in 1...100 {
    fizzbuzz(withNumber: i)
}

// Pattern matching with loops

let twostraws = (name: "twostraws", password: "fr0st1es")
let bilbo = (name: "Bilbo", password: "bagg1n5")
let taylor = (name: "Taylor", password: "fr0st1es")

let users = [twostraws, bilbo, taylor]

for user in users {
    print(user.name)
}

for case ("twostraws", "fr0st1es") in users {
    print("User twostraws has the password fr0st1es")
}

for case (let name, let password) in users {
    print("User's name is \(name) and password is \(password)")
}

for case let (name, password) in users {
    print("User's name is \(name) and password is \(password)")
}

for case let (name, "fr0st1es") in users {
    print("Username is \(name)")
}

// Pattern matching with optionals

let newNewName: String? = "twostraws"
let newNewPassword: String? = "fr0st1es"

switch (newNewName, newNewPassword) {
case (.some(name), .some(password)):
    print("newNewName is \(name) and newNewPassword is \(password)")
default:
    print("Every value was a nil")
}

switch (newNewName, newNewPassword) {
case let (name?, password?):
    print("newNewName is \(name) and newNewPassword is \(password)")
default:
    print("Every value was nil")
}

let newNames: [String?] = ["Luis", nil, "Manuel"]

for case let .some(name) in newNames {
    print(name)
}

for case let name? in newNames {
    print(name)
}

// Pattern matching with ranges

let age = 36

switch age {
case 0..<18:
    print("You can't drink")
case 0..<70:
    print("You are old")
default:
    print("You are dead")
}

if case 0..<18 = age {
    print("You can't drink")
} else if case 0..<70  = age {
    print("You are old")
} else {
    print("You are dead")
}

if  0..<18 ~= age {
    print("You can't drink")
} else if 0..<70  ~= age {
    print("You are old")
} else {
    print("You are dead")
}

if (0..<18).contains(age) {
    print("You can't drink")
} else if (0..<70).contains(age) {
    print("You are old")
} else {
    print("You are dead")
}

let newUser = (name: "twostraws", password: "fr0s1es", age: 36)

switch newUser	 {
case let (noName, _, 0..<18):
    print("\(noName) has the energy and time, but no money")
case let (noName, _, 18..<70):
    print("\(noName) has the money and energy, but no time")
case let (noname, _, _):
    print("\(noname) is dead")
}

// Matching enums and associated values

enum WeatherType {
    case cloudy
    case sunny
    case windy
}

let today = WeatherType.cloudy

switch today {
case .cloudy:
    print("Cloudy")
case .sunny:
    print("Sunny")
case .windy:
    print("windy")
}

if today == .cloudy {
    print("Cloudy")
}

enum newWeatherType {
    case cloudy(coverage: Int)
    case sunny
    case windy
}

let newToday = newWeatherType.cloudy(coverage: 100)

switch newToday {
case .cloudy:
    print("Cloudy")
case .sunny:
    print("Sunny")
case .windy:
    print("windy")
}

switch newToday {
case .cloudy(let coverage):
    print("Cloud coverage is \(coverage)")
case .sunny:
    print("Sunny")
case .windy:
    print("windy")
}


switch newToday {
case .cloudy(let coverage) where coverage < 100:
    print("Cloud coverage is \(coverage)")
case .cloudy(let coverage) where coverage == 100:
    print("Its overcast")
case .sunny:
    print("Sunny")
case .windy:
    print("windy")
default:
print("")
}

switch newToday {
case .cloudy(let coverage) where coverage == 0:
    print("its not cloudy")
case .cloudy(let coverage) where (0..<50).contains(coverage):
    print(("its at least 50% coverage"))
case .cloudy(let coverage) where coverage > 50:
    print("There are a lot of clouds")
default:
    print("")
}

let forecast: [WeatherType] = [.cloudy, .sunny, .windy]

for day in forecast where day == .cloudy {
    print(day)
}

let newForecast: [newWeatherType] = [.cloudy(coverage: 40), .sunny, .cloudy(coverage: 100), .sunny]

for case let .cloudy(coverage) in newForecast {
    print(coverage)
}

// Matching types

let view: AnyObject = UIButton()

switch view {
case is UIButton:
    print("Found a button")
default:
    print("Found a view")
}

view.addSubview(UIButton())

// No type casting
for button in view.subviews where button is UIButton {
    print(button)
}

for case let button as UIButton in view.subviews {
    print("Found a button \(button)")
}


