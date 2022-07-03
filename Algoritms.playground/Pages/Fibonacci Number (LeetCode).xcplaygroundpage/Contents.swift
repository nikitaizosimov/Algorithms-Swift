import Foundation
import XCTest

/*:
 # Fibonacci Number  - EASY
 https://leetcode.com/problems/fibonacci-number/
 
 The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

 F(0) = 0, F(1) = 1
 F(n) = F(n - 1) + F(n - 2), for n > 1.
 
 ## Example:
 
 Input: n = 2
 Output: 1
 
 Input: n = 3
 Output: 2
 
 Input: n = 4
 Output: 3
 */

class Solution {
    
    func fib(_ n: Int) -> Int {
        guard n > 1 else { return n }
        
        return fib(n - 1) + fib(n - 2)
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.fib(2)
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.fib(3)
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.fib(4)
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()

