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

