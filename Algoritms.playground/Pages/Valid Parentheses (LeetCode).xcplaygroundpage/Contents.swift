import Foundation
import XCTest

/*:
 # Valid Parentheses - Easy
 https://leetcode.com/problems/valid-parentheses/
 
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 
 ## Example:
 
 Input: s = "()"
 Output: true
 
 Input: s = "()[]{}"
 Output: true
 
 Input: s = "(]"
 Output: false
 
 Input: s = "{[]}"
 Output: true
*/

class Solution {
    
    func isValid(_ s: String) -> Bool {
        var symbolStack = [Character]()
        
        for parenthes in s {
            if parenthes == "(" ||
               parenthes == "{" ||
               parenthes == "[" {
                symbolStack.append(parenthes)
                continue
            }
            
            guard let lastStackSymbol = symbolStack.last else { return false }
            
            switch parenthes {
            case ")":
                guard lastStackSymbol == "(" else { return false }
            case "]":
                guard lastStackSymbol == "[" else { return false }
            case "}":
                guard lastStackSymbol == "{" else { return false }
            default:
                return false
            }
            
            symbolStack.popLast()
        }
        
        return symbolStack.isEmpty
    }
}

final class Tests: XCTestCase {
    
    func test0() {
        let value = Solution().isValid("()")
        XCTAssertTrue(value)
    }
    
    func test1() {
        let value = Solution().isValid("()[]{}")
        XCTAssertTrue(value)
    }

    func test2() {
        let value = Solution().isValid("(]")
        XCTAssertFalse(value)
    }

    func test3() {
        let value = Solution().isValid("(]")
        XCTAssertFalse(value)
    }
}

Tests.defaultTestSuite.run()
