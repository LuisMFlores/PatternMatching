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
print(lazyTaylor.reversedName)


// lazy methods

class LazySingetTwo {
    let name: String
    lazy var reversedName = self.getReversedName()
    
    init(name: String) {
        self.name = name
    }
    
    private func getReversedName() -> String {
        return "\(self.name.uppercased()) backward is \(String(self.name.uppercased().reversed()))!"
    }
}

let lazySingerTwo = LazySingetTwo (name: "Luis Manuel")
print(lazySingerTwo.reversedName)

// Lazy Singleton

class MusicPlayer {
    init() {
        print("Ready To Play")
    }
}

class NewSingerMusicPlayer {
    static let musicPlayer = MusicPlayer()
    init() {
        print("Creating a nenw singer")
    }
}

let luima = NewSingerMusicPlayer()
NewSingerMusicPlayer.musicPlayer

// Lazy sequence

func fibonnaci(of num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        return fibonnaci(of: num - 1) + fibonnaci(of: num - 2)
    }
}

let fibonnaciSequence = Array(0...199).lazy.map(fibonnaci)
print(fibonnaciSequence[19])

// Destructing

var data = ("one", "two", "three")
let one = data.0
let two = data.1
let three = data.2

let (newOne, newTwo, newThree) = data
print(newOne)

func getPerson() -> (String, Int) {
    return ("Taylor Swift", 26)
}
let (name, age) = getPerson()
print("The person's name is \(name) and is \(age) years old")
