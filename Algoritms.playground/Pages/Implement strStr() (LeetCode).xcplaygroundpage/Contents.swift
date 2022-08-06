import Foundation
import XCTest

/*:
 # Implement strStr() - Easy
 https://leetcode.com/problems/implement-strstr/
 
 Implement strStr().

 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

 ## Example:
 
 Input: haystack = "hello", needle = "ll" \
 Output: 2

 Input: haystack = "aaaaa", needle = "bba" \
 Output: -1
*/

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.isEmpty,
              haystack != needle else { return 0 }
        
        guard haystack.isEmpty,
              haystack.count > needle.count else { return -1 }
        
        var tempHaystack = haystack
        var count = 0
        
        for _ in haystack.enumerated() {
            
            count += 1
            if tempHaystack.hasPrefix(needle) {
                return count
            }
            
            tempHaystack.removeFirst()
        }
        
        return -1
    }
}

final class Tests: XCTestCase {
    
    func test0() {
        let value = Solution().strStr("hello", "ll")
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = Solution().strStr("aaaaa", "bba")
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
