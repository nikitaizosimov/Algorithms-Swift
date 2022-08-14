import Foundation
import XCTest

/*:
 # Longest Common Prefix - EASY
 https://leetcode.com/problems/longest-common-prefix/
 
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".
 
 ## Example:
 
 Input: strs = ["flower","flow","flight"] \
 Output: "fl"
 
 Input: strs = ["dog","racecar","car"] \
 Output: ""
 
 Input: strs = ["a","b"] \
 Output: ""
 */

class Solution {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard var minWord = strs.min() else { return "" }
        
        for str in strs {
            while !str.hasPrefix(minWord) {
                minWord.removeLast()
            }
        }
        
        return minWord
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.longestCommonPrefix(["flower","flow","flight"])
        XCTAssertEqual(value, "fl")
    }

    func test1() {
        let value = solution.longestCommonPrefix(["dog","racecar","car"])
        XCTAssertEqual(value, "")
    }
    
    func test2() {
        let value = solution.longestCommonPrefix(["a","b"])
        XCTAssertEqual(value, "")
    }
}

Tests.defaultTestSuite.run()
