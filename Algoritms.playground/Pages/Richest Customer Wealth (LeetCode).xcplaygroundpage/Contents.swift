import Foundation
import XCTest

/*:
 # Richest Customer Wealth  - EASY
 https://leetcode.com/problems/richest-customer-wealth/
 
 You are given an m x n integer grid accounts where accounts[i][j] is the amount of money the i​​​​​​​​​​​th​​​​ customer has in the j​​​​​​​​​​​th​​​​ bank. Return the wealth that the richest customer has.
 
 ## Example:
 
 Input: accounts = [[1,2,3],[3,2,1]] \
 Output: 6
 
 Input: accounts = [[1,5],[7,3],[3,5]] \
 Output: 10
 
 Input: accounts = [[2,8,7],[7,1,3],[1,9,5]] \
 Output: 17
 */

class Solution {
    
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        return accounts.map { $0.reduce(0) { $0 + $1 } }.max() ?? 0
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.maximumWealth([[1,2,3],[3,2,1]])
        XCTAssertEqual(value, 6)
    }
    
    func test1() {
        let value = solution.maximumWealth([[1,5],[7,3],[3,5]])
        XCTAssertEqual(value, 10)
    }
    
    func test2() {
        let value = solution.maximumWealth([[2,8,7],[7,1,3],[1,9,5]])
        XCTAssertEqual(value, 17)
    }
}

Tests.defaultTestSuite.run()
