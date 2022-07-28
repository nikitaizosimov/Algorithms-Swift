import Foundation
import XCTest

/*:
 # Reverse Integer - Medium
 https://leetcode.com/problems/reverse-integer/
 
 Given a signed 32-bit integer x, return x with its digits reversed.
 
 If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
 
 ## Example:
 
 Input: x = 123 \
 Output: 321

 Input: x = -123 \
 Output: -321

 Input: x = 120 \
 Output: 21
 */

class Solution {
    
    func reverse(_ x: Int) -> Int {
        var rev = 0
        var tempX = x
        
        while tempX != 0 {
            rev = (tempX % 10) + (rev * 10)
            tempX /= 10
        }
        
        guard rev < Int32.max,
              rev > Int32.min else { return 0 }
        
        return rev
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.reverse(123)
        XCTAssertEqual(value, 321)
    }
    
    func test1() {
        let value = solution.reverse(-123)
        XCTAssertEqual(value, -321)
    }
    
    func test2() {
        let value = solution.reverse(120)
        XCTAssertEqual(value, 21)
    }
}

Tests.defaultTestSuite.run()

