import Foundation
import XCTest

/*:
 # Length of Last Word - Easy
 https://leetcode.com/problems/length-of-last-word/
 
 Given a string s consisting of words and spaces, return the length of the last word in the string.

 A word is a maximal substring consisting of non-space characters only.

 ## Example:
 
 Input: s = "Hello World" \
 Output: 5

 Input: s = "   fly me   to   the moon  " \
 Output: 4

 Input: s = "luffy is still joyboy" \
 Output: 6
*/


class Solution {
    
    func lengthOfLastWord(_ s: String) -> Int {
        var tempS = s
        var count = 0
        
        while tempS.last == " " {
            tempS.removeLast()
        }
        
        for char in tempS.reversed() {
            guard char.isLetter else {
                break
            }
            
            count += 1
        }
        
        return count
    }
}

final class Tests: XCTestCase {
    
    func test0() {
        let value = Solution().lengthOfLastWord("Hello World")
        XCTAssertEqual(value, 5)
    }
    
    func test1() {
        let value = Solution().lengthOfLastWord("   fly me   to   the moon  ")
        XCTAssertEqual(value, 4)
    }
    
    func test2() {
        let value = Solution().lengthOfLastWord("luffy is still joyboy")
        XCTAssertEqual(value, 6)
    }
}

Tests.defaultTestSuite.run()
