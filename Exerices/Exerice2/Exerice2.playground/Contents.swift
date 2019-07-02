import Foundation

extension Int {
    
    func isPerfectNumber() -> Bool {
        var total = 0
        for i in 1...self {
            if self % i == 0 {
                total += 1
            }
        }
        return total == self
    }
    
    func isFibonacci() -> Bool {
        var x = 0
        var z = 0
        var y = 1
        
        while z < self {
            z = x + y
            x = y
            y = z
        }
        return z == self
    }
}

class MathematicHelper {
    
    typealias QuadraticEquationResult = (x1: Float?, x2: Float?)
    
    class func caculateQuadraticEquation(a: Float, b: Float, c: Float) -> QuadraticEquationResult {
        guard a > 0 && b > 0 && c > 0 else {
            return (0, 0)
        }
        
        var result: QuadraticEquationResult
        let delta: Float = Float(b * b - 4 * a * c);
        if delta == 0 {
            // Nghiem kep
            let x = -b / (2 * a)
            result.x1 = x
            result.x2 = x
        } else if delta > 0 {
            // Hai nghiem phan biet
            result.x1 = (-b + sqrt(delta))/(2*a)
            result.x2 = (-b - sqrt(delta))/(2*a)
        }
        return result
    }
    
}

struct TestVariables {
    static var n = 1000
    static var equationVariables: (a: Float, b: Float, c: Float) = (23, 34, 12)
    static var testVar = 46
}

func main() {
    
    func printPerfectNumber () {
        print("-------------------------")
        print("In so nguyen to tu 1 den 1000")
        for number in 1...TestVariables.n {
            if number.isPerfectNumber() {
                print("\(number) is a perfect number!")
            }
        }
    }
    
    func caculateQuadraticEquation() {
        print("-------------------------")
        print("Giai phuong trinh bac hai")
        let reuslt = MathematicHelper
            .caculateQuadraticEquation(a: TestVariables.equationVariables.a,
                                       b: TestVariables.equationVariables.b,
                                       c: TestVariables.equationVariables.c)
        if reuslt.x1 != nil && reuslt.x2 != nil {
            print("Pt vô nghiệm")
        } else {
            print("Nghiệm của pt là: x1 = \(reuslt.x1!) x2 = \(reuslt.x2!)")
        }
    }
    
    func checkFibonacci() {
        print("-------------------------")
        print("Kiểm tra số Finonacci")
        let string = TestVariables.testVar.isFibonacci() ? "là" : "không là"
        print("\(TestVariables.testVar) \(string) số Fibonacci!")
    }
    
    // Run
    printPerfectNumber()
    caculateQuadraticEquation()
    checkFibonacci()
}
print("OK")
main()
