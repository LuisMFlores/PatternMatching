import UIKit
import Foundation

// Generics

func inspect<T>(withValue value: T) {
    print("Inspecting  \(type(of:value))")
}

// Limiting generics

func square<T: Numeric>(withValue value: T) -> T {
    return value * value
}

print(square(withValue: 16.5))

// Creating a generic type

struct Deque<T> {
    var array = [T]()
    
    mutating func pushBack(_ obj: T) {
        array.append(obj)
    }
    
    mutating func pushFront(_ obj: T) {
        array.insert(obj, at: 0)
    }
    
    mutating func popBack() -> T {
        return array.removeLast()
    }
    
    mutating func popFront() -> T? {
        guard !array.isEmpty else { return nil }
        return array.removeFirst()
    }
}

var testDequeue = Deque<Int>()
testDequeue.pushBack(10)
testDequeue.pushFront(1)
print(testDequeue)
testDequeue.popBack()
testDequeue.popFront()

// Working with cocoa types

struct CustomCountedSet<T:Any> {
    let internalSet = NSCountedSet()
    
    mutating func add(_ object: T) {
        internalSet.add(object)
    }
    
    mutating func remove(_ object: T) {
        internalSet.remove(object)
    }
    
    func count(for object: T) -> Int {
        return internalSet.count(for: object)
    }
    
}

var countedSet = CustomCountedSet<String>()
countedSet.add("Hello")
countedSet.add("Hello")
print(countedSet.count(for: "Hello"))
