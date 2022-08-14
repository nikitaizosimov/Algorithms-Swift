import Foundation
import XCTest

/*:
 # Find Pivot Index- EASY
 https://leetcode.com/problems/find-pivot-index/
 
 Given an array of integers nums, calculate the pivot index of this array.
 The pivot index is the index where the sum of all the numbers strictly to the left of the index is equal to the sum of all the numbers strictly to the index's right.
 Return the leftmost pivot index. If no such index exists, return -1.
 
 ## Example:
 
 Input: nums = [1,7,3,6,5,6] \
 Output: 3
 
 Input: nums = [1,2,3] \
 Output: -1
 
 Input: nums = [2,1,-1] \
 Output: 0
 */

class Solution {
    
    func pivotIndex(_ nums: [Int]) -> Int {
        let total = nums.reduce(0) { $0 + $1}
        var sum = 0
        
        for (index, num) in nums.enumerated() {
            if sum + num == total - sum {
                return index
            }
            sum += num
        }
        
        return -1
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.pivotIndex([1,7,3,6,5,6])
        XCTAssertEqual(value, 3)
    }

    func test1() {
        let value = solution.pivotIndex([1,2,3])
        XCTAssertEqual(value, -1)
    }

    func test2() {
        let value = solution.pivotIndex([2,1,-1])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
