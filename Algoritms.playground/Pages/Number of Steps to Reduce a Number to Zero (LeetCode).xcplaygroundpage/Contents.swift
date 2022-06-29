import Foundation
import XCTest

/*:
 # Number of Steps to Reduce a Number to Zero  - EASY
 https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/
 
 Given an integer num, return the number of steps to reduce it to zero.
 In one step, if the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.
 
 ## Example:
 
 Input: num = 14
 Output: 6
 
 Input: num = 8
 Output: 4
 
 Input: num = 123
 Output: 12
 */

class Solution {
    
    func numberOfSteps(_ num: Int) -> Int {
        return String(num, radix: 2).reduce(-1) { $1 == "0" ? $0 + 1 : $0 + 2 }
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.numberOfSteps(14)
        XCTAssertEqual(value, 6)
    }
    
    func test1() {
        let value = solution.numberOfSteps(8)
        XCTAssertEqual(value, 4)
    }
    
    func test2() {
        let value = solution.numberOfSteps(123)
        XCTAssertEqual(value, 12)
    }
    
    func test3() {
        let value = solution.numberOfSteps(0)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
