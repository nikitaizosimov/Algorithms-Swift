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
 
 Input: s = "a", t = "a" \
 Output: true
 
 Input: s = "badc", t = "baba" \
 Output: false
 */

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var dictCipher = [Character: Character]()
        var seenChar = Set<Character>()
        
        for (sChar, tChar) in zip(s, t) {
            if let sVal = dictCipher[sChar] {
                guard sVal == tChar else {
                    return false
                }
            } else {
                guard !seenChar.contains(tChar) else {
                    return false
                }
                
                dictCipher[sChar] = tChar
                seenChar.insert(tChar)
            }
        }
        
        return true
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
    
    func test3() {
        let value = solution.isIsomorphic("a", "a")
        XCTAssertEqual(value, true)
    }
    
    func test4() {
        let value = solution.isIsomorphic("badc", "baba")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
