import Foundation
import XCTest

/*:
 # Two Sum - EASY
 https://leetcode.com/problems/two-sum/
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 
 ## Example:
 
 Input: nums = [2,7,11,15], target = 9 \
 Output: [0,1]
 
 Input: nums = [3,2,4], target = 6 \
 Output: [1,2]
 
 Input: nums = [3,3], target = 6 \
 Output: [0,1]
 */

class Solution {
        
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if let key = dict.first(where: { $0.value == target - num })?.key {
                return [key, index]
            }
            
            dict[index] = num
        }
        
        return []
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.twoSum([2,7,11,15], 9)
        XCTAssertEqual(value, [0, 1])
    }
    
    func test1() {
        let value = solution.twoSum([3,2,4], 6)
        XCTAssertEqual(value, [1, 2])
    }
    
    func test2() {
        let value = solution.twoSum([3,3], 6)
        XCTAssertEqual(value, [0, 1])
    }
}

Tests.defaultTestSuite.run()
