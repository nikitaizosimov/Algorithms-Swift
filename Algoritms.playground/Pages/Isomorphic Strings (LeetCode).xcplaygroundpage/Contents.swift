import Foundation
import XCTest

/*:
 #  Isomorphic Strings - EASY
 https://leetcode.com/problems/isomorphic-strings/
 
 Given two strings s and t, determine if they are isomorphic.

 Two strings s and t are isomorphic if the characters in s can be replaced to get t.
 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.
 
 ## Example:
 
 Input: s = "egg", t = "add" \
 Output: true

 Input: s = "foo", t = "bar" \
 Output: false

 Input: s = "paper", t = "title" \
 Output: true
 */

class Solution {
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let tempArray = Array(s)
        
        var dictCipher = [Character: Character]()
        
        for (index, char) in s.enumerated() {
            dictCipher[char] = Array(t)[index]
        }
        
        return String(tempArray.compactMap { dictCipher[$0]  }) == t
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isIsomorphic("egg", "add")
        XCTAssertEqual(value, true)
    }

    func test1() {
        let value = solution.isIsomorphic("foo", "bar")
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.isIsomorphic("paper", "title")
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()

