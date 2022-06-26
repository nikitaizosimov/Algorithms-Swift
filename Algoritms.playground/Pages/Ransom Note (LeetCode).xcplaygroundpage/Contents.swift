import Foundation
import XCTest

/*:
 # Ransom Note - EASY
 https://leetcode.com/problems/ransom-note/
 
 Each letter in magazine can only be used once in ransomNote.
 
 ## Example:
 
 ransomNote = "aa", magazine = "ab" - false
 ransomNote = "aa", magazine = "aab" - true
 
 ransomNote = "wow, lord", magazine = "hellow, world" - true
 */

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magazine = magazine
        
        for char in ransomNote {
            guard let index = magazine.firstIndex(where: { $0 == char }) else { return false }
            
            magazine.remove(at: index)
        }
        
        return true
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.canConstruct("aa", "ab")
        XCTAssertEqual(value, false)
    }
    
    func test1() {
        let value = solution.canConstruct("aa", "aab")
        XCTAssertEqual(value, true)
    }
    
    func test2() {
        let value = solution.canConstruct("wow, lord", "hellow, world")
        XCTAssertEqual(value, true)
    }
    
    func test3() {
        let value = solution.canConstruct("wow, world", "hellow, world")
        XCTAssertEqual(value, false)
    }
    
    func test4() {
        let value = solution.canConstruct("kenny", "kennny")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
