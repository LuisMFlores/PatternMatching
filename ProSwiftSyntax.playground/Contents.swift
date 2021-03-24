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

