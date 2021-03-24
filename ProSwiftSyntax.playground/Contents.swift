import UIKit

// Generics

func inspect<T>(withValue value: T) {
    print("Inspecting  \(type(of:value))")
}

struct Dog {
    
}

inspect(withValue: Dog())
