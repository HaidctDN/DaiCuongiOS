import Foundation

class Object: NSObject {
    
    var name: String {
        return String(describing: self)
    }

    func toString() -> String {
        return name + " : "
    }
}

class Triangle: Object {
    
    var a: Float = 5
    var b: Float = 8
    var c: Float = 9
    
    enum TriangleType: Int {
        case noneType
        case normal
        case equilateral
        case isosceles
        case rightIsosceles
        case right
        
        func toString() -> String {
            switch self {
            case .normal:
                return "Thường"
            case .equilateral:
                return "Đều"
            case .isosceles:
                return "Cân"
            case .right:
                return "Vuông"
            case .rightIsosceles:
                return "Vuông cân"
            default:
                return "K phải"
            }
        }
    }
    
    override var name: String {
        return "Tam giác"
    }
    
    override init() {
        super.init()
    }
    
    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    // Exerice 5:
    func printArea() {
        let p = (a + b + c) / 2
        let area = sqrt(p * (p-a) * (p-b) * (p-c))
        print("Diện tích hình \(name) là: \(area)")
    }
    
    // Exerice 6:
    func printType() {
        var triangleType: TriangleType = .noneType
        if ((a + b) > c && (a + c) > b && (b + c) > a && a > 0 && b > 0 && c > 0) {
            triangleType = .normal
            if (a==b) && (b==c) && (c==a) {
                triangleType = .equilateral
            } else if (a==b)||(b==c)||(a==c) {
                triangleType = .isosceles
            } else if ((a * a + b * b == c * c) && (a == b)) || ( a * a + c * c == b * b) && ( a == c) || ( c * c + b * b == a * a) && ( c == b) {
                triangleType = .rightIsosceles
            } else if (a*a==b*b+c*c)||(b*b==a*a+c*c)||(c*c==a*a+b*b) {
                triangleType = .right
            }
        }
        print("Đây là \(name): \(triangleType.toString())")
    }
}


func main() {
    let triangle = Triangle()
    triangle.printArea()
    print("-----------------------")
    triangle.printType()
}

main()

