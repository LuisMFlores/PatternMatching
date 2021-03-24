import UIKit

//runSyntaxChapter()

// Lazy loading

class Singer {
    let name: String
    let reversedNameString: String
    
    init(name: String) {
        self.name = name
        // Slow code since it will be calculate multiple time whether or not this property is used
        self.reversedNameString = "\(name.uppercased()) backward is \(String(name.uppercased().reversed()))!"
    }
    
    func reversedName() -> String {
        return "\(name.uppercased()) backward is \(String(name.uppercased().reversed()))!"
    }
}

let taylor = Singer(name: "Taylor Swift")
print(taylor.reversedName())

// Lazy closures

class LazySinger {
    let name: String
    lazy var reversedName: String = {
        "\(self.name.uppercased()) backward is \(String(self.name.uppercased().reversed()))!"
    }()
    
    init(name: String) {
        self.name = name
    }
    
}

let lazyTaylor = Singer(name: "Taylor Swift")
print(taylor.reversedName)
