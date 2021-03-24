import UIKit

// Nested functions classes and structs

enum London {
    static let coordinates = (lat: 51.507222, lon: -0.1275)
    
    enum SubwayLines {
        case bakerloo, central, circle, district, elizabeth, hamersmithCity, jubilee, metropolitan, northern, piccdailly, victoria, waterlooCity
    }
    
    enum Places {
        case buckinghamPalace, cityHall, oldBailey, piccadilly, stPaulsCathedral
    }
}

// Nested functions

struct Point {
    let x: Double
    let y: Double
}

enum DistanceTechnique {
    case euclidean
    case euclideanSquare
    case manhattan
}

func calculateDistance(start: Point, end: Point, technique: DistanceTechnique) -> Double {
    func calculateEuclideanDistanceSquared() -> Double {
        let deltaX = start.x - end.x
        let deltaY = start.y - end.y
        
        return deltaX * deltaX + deltaY * deltaY
    }

    func calculateEuclideanDistance() -> Double {
        return sqrt(calculateEuclideanDistanceSquared())
    }

    func calculateManhattanDistance() -> Double {
        return abs(start.x - end.x) + abs(start.y - end.y)
    }
    
    switch technique {
    case .euclideanSquare:
        return calculateEuclideanDistanceSquared()
    case .euclidean:
        return calculateEuclideanDistance()
    case .manhattan:
        return calculateManhattanDistance()
    }
}



switch technique {
case <#pattern#>:
    <#code#>
default:
    <#code#>
}

let start = Point(x: 10, y: 10)
let end = Point(x: 20, y: 20)

print(calculateEuclideanDistanceSquared(start: start, end: end))
print(calculateEuclideanDistance(start: start, end: end))
print(calculateManhattanDistance(start: start, end: end))
