import Foundation
import XCTest

/*:
 #  Number of 1 Bits - EASY
 https://leetcode.com/problems/number-of-1-bits/
 
 Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).
 
 ## Example:
 
 Input: n = 00000000000000000000000000001011
 Output: 3
 
 Input: n = 00000000000000000000000010000000
 Output: 1

 Input: n = 11111111111111111111111111111101
 Output: 31
 */

class Solution {
    
    func hammingWeight(_ n: Int) -> Int {
        let nString = String(n)
        return String(n).reduce(0) { $0 + $1 == "0" ? 0 : 1 }
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.hammingWeight(00000000000000000000000000001011)
        XCTAssertEqual(value, 3)
    }

    func test1() {
        let value = solution.hammingWeight(00000000000000000000000010000000)
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.hammingWeight(11111111111111111111111111111101)
        XCTAssertEqual(value, 31)
    }
}

Tests.defaultTestSuite.run()
