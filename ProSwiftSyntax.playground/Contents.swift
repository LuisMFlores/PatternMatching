import UIKit

// Generics

func inspect<T>(withValue value: T) {
    print("Inspecting  \(type(of:value))")
}

// Limiting generics

func square<T: Numeric>(withValue value: T) -> T {
    return value * value
}

print(square(withValue: 16.5))
