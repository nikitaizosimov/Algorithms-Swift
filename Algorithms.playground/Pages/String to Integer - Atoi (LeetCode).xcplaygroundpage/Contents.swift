import Foundation
import XCTest

/*:
 # String to Integer - Atoi - Medium
 https://leetcode.com/problems/string-to-integer-atoi/
 
 The algorithm for myAtoi(string s) is as follows:

 Read in and ignore any leading whitespace.
 Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
 Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
 Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
 If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
 Return the integer as the final result.
 Note:

 Only the space character ' ' is considered a whitespace character.
 Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.
 
 ## Example:
 
 Input: s = "42"
 Output: 42
 
 Input: s = "   -42"
 Output: -42
 
 Input: s = "4193 with words"
 Output: 4193
 
 Input: s = "words and 987"
 Output: 0
 */

class Solution {
    
    func myAtoi(_ s: String) -> Int {
        var sum = 0
        
        var signSum = 1
        var isStarted = false
        
        for char in s {
            if char.isWhitespace {
                guard !isStarted else { break }
                
                continue
            } else if char.isNumber {
                sum = sum * 10 + (char.wholeNumberValue ?? 0)
                if sum > Int32.max {
                    return signSum == 1 ? Int(Int32.max) : Int(Int32.min)
                }
            } else if char == "-" || char == "+" {
                guard !isStarted else { break }
                
                signSum *= char == "-" ? -1 : 1
            } else {
                break
            }
            
            isStarted = true
        }
        
        return sum * signSum
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.myAtoi("42")
        XCTAssertEqual(value, 42)
    }
    
    func test1() {
        let value = solution.myAtoi("   -42")
        XCTAssertEqual(value, -42)
    }
    
    func test2() {
        let value = solution.myAtoi("4193 with words")
        XCTAssertEqual(value, 4193)
    }
    
    func test3() {
        let value = solution.myAtoi("words and 987")
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
