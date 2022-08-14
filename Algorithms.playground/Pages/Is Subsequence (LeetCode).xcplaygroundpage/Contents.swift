import Foundation
import XCTest

/*:
 #  Is Subsequence- EASY
 https://leetcode.com/problems/is-subsequence/
 
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
 
 ## Example:
 
 Input: s = "abc", t = "ahbgdc" \
 Output: true
 
 Input: s = "axc", t = "ahbgdc" \
 Output: false
 */

class Solution {
    
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var sArray = Array(s)

        for char in t where sArray.first == char {
            sArray.removeFirst()
        }

        return sArray.isEmpty
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isSubsequence("abc", "ahbgdc")
        XCTAssertEqual(value, true)
    }

    func test1() {
        let value = solution.isSubsequence("axc", "ahbgdc")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
