import UIKit

//runSyntaxChapter()
//runNilCoalescing()

// Nil Coalescing

var name: String? = "Taylor"
name = nil
var unwrappedName = name ?? "Anonymous"
print(unwrappedName)

print(name ?? "Anonymus")

var savedText: String

do {
    savedText = try String(contentsOfFile: "saved.txt")
} catch {
    print("Failed to fetch this")
    savedText = "Hello, World"
}

print(savedText)

savedText = (try? String(contentsOfFile: "saved.txt")) ?? "Hello world"
print(savedText)
