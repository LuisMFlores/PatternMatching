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
