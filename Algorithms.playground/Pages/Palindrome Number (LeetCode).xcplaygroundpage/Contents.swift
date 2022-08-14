import Foundation
import XCTest

/*:
 # Palindrome Number - Medium
 https://leetcode.com/problems/palindrome-number/
 
 Given an integer x, return true if x is palindrome integer.

 An integer is a palindrome when it reads the same backward as forward.

 For example, 121 is a palindrome while 123 is not.
 
 ## Example:
 
 Input: x = 121 \
 Output: true

 Input: x = -121 \
 Output: false

 Input: x = 10 \
 Output: false
 
 Input: x = 0 \
 Output: true
 */

class Solution {
    
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        
        guard x > 9 else { return true }
        
        var temp = x
        var reversedX = 0
        
        while temp != 0 {
            reversedX = (temp % 10) + (reversedX * 10)
            temp = temp / 10
        }
        
        return x == reversedX
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isPalindrome(121)
        XCTAssertEqual(value, true)
    }

    func test1() {
        let value = solution.isPalindrome(-121)
        XCTAssertEqual(value, false)
    }

    func test2() {
        let value = solution.isPalindrome(10)
        XCTAssertEqual(value, false)
    }

    func test3() {
        let value = solution.isPalindrome(0)
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()
