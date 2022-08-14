import Foundation
import XCTest

/*:
 # Convert Roman Numbers to Integer - EASY
 https://leetcode.com/problems/roman-to-integer/
 
 ## Example:
 
 "I" = 1 \
 "V" = 5 \
 "IV" = 4 \
 "C" = 100 \
 "M" = 100 \
 "CM" = 900 \
 */

class Solution {
    
    enum RomanInteger: String {
        
        case i = "I"
        case v = "V"
        case x = "X"
        case l = "L"
        case c = "C"
        case d = "D"
        case m = "M"
        case `default`
        
        var number: Int {
            switch self {
            
            case .i: return 1
            case .v: return 5
            case .x: return 10
            case .l: return 50
            case .c: return 100
            case .d: return 500
            case .m: return 1000
            case .default: return 0
            }
        }
    }
    
    func romanToInt(_ s: String) -> Int {
        var sum: Int = 0
        var prevNum: Int = 0
        
        for char in s {
            guard let romanNumber = RomanInteger(rawValue: String(char))?.number else { continue }
            
            sum += prevNum < romanNumber ? -prevNum : prevNum
            
            prevNum = romanNumber
        }
        
        return sum + prevNum
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // III = 3
    func test0() {
        let value = solution.romanToInt("III")
        XCTAssertEqual(value, 3)
    }
    
    // L = 50, V = 5, III = 3
    func test1() {
        let value = solution.romanToInt("LVIII")
        XCTAssertEqual(value, 58)
    }
    
    // M = 1000, CM = 900, XC = 90 and IV = 4
    func test2() {
        let value = solution.romanToInt("MCMXCIV")
        XCTAssertEqual(value, 1994)
    }
    
    // M = 1000, CM = 900, XC = 90 and IV = 4
    func test3() {
        let value = solution.romanToInt("MCMXCIV")
        XCTAssertEqual(value, 1994)
    }
    
    //CM = 900, L = 50, IX = 9
    func test4() {
        let value = solution.romanToInt("CMLIX")
        XCTAssertEqual(value, 959)
    }
}

Tests.defaultTestSuite.run()
