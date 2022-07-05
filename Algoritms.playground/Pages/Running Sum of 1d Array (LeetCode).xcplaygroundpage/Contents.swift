import Foundation
import XCTest

/*:
 # Running Sum of 1d Array- EASY
 https://leetcode.com/problems/running-sum-of-1d-array/
 
 Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
 Return the running sum of nums.
 
 ## Example:
 
 Input: nums = [1,2,3,4]
 Output: [1,3,6,10]
 
 Input: nums = [1,1,1,1,1]
 Output: [1,2,3,4,5]
 
 Input: nums = [3,1,2,10,1]
 Output: [3,4,6,16,17]
 */

class Solution {
    
    func runningSum(_ nums: [Int]) -> [Int] {
        return nums.reduce(into: []) { $0.append($1 + ($0.last ?? 0) ) }
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.runningSum([1, 2, 3, 4])
        XCTAssertEqual(value, [1, 3, 6, 10])
    }

    func test1() {
        let value = solution.runningSum([1, 1, 1, 1, 1])
        XCTAssertEqual(value, [1, 2, 3, 4, 5])
    }

    func test2() {
        let value = solution.runningSum([3, 1, 2, 10, 1])
        XCTAssertEqual(value, [3, 4, 6, 16, 17])
    }
}

Tests.defaultTestSuite.run()
