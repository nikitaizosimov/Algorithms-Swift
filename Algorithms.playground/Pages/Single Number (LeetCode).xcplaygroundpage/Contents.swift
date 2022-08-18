import Foundation
import XCTest

/*:
 # Single Number - Easy
 https://leetcode.com/problems/single-number/
 
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.

 ## Example:
 
 Input: nums = [2,2,1]
 Output: 1
 
 Input: nums = [4,1,2,1,2]
 Output: 4

 Input: nums = [1]
 Output: 1
*/


class Solution {
    
    func singleNumber(_ nums: [Int]) -> Int {
        var tempNums = nums
        
        for num in tempNums {
            guard let index = tempNums.firstIndex(where: { $0 == num }) else { break }
            
            tempNums.remove(at: index)
            
            guard let index = tempNums.firstIndex(where: { $0 == num }) else {
                return num
            }
            
            tempNums.remove(at: index)
        }
        
        return 0
    }
}

final class Tests: XCTestCase {
    
    func test0() {
        let value = Solution().singleNumber([2, 2, 1])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = Solution().singleNumber([4,1,2,1,2])
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = Solution().singleNumber([1])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()

