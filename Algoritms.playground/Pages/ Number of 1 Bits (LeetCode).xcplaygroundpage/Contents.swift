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
        return n.nonzeroBitCount
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let num: UInt32 = 00000000000000000000000000001011
        let value = solution.hammingWeight(Int(num))
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
