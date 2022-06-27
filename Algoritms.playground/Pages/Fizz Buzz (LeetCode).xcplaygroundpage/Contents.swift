import Foundation
import XCTest

/*:
 # Fizz Buzz - EASY
 https://leetcode.com/problems/fizz-buzz/
 
 "FizzBuzz" if divisible by 3 and 5.
 "Fizz" if divisible by 3.
 "Buzz" if divisible by 5.
 "number" if none of the above conditions are true.
 
 ## Example:
 
 Input: n = 3 \
 Output: ["1","2","Fizz"]
 
 Input: n = 5 \
 Output: ["1","2","Fizz","4","Buzz"]
 
 Input: n = 15 \
 Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
 */

class Solution {
    
    func fizzBuzz(_ n: Int) -> [String] {
        var output = [String]()
        
        for i in 1...n {
            switch (i % 3, i % 5) {
            case (0, 0): output.append("FizzBuzz")
            case (0, _): output.append("Fizz")
            case (_, 0): output.append("Buzz")
            default: output.append(String(i))
            }
        }
        
        return output
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.fizzBuzz(3)
        XCTAssertEqual(value, ["1","2","Fizz"])
    }
    
    func test1() {
        let value = solution.fizzBuzz(5)
        XCTAssertEqual(value, ["1","2","Fizz","4","Buzz"])
    }
    
    func test2() {
        let value = solution.fizzBuzz(15)
        XCTAssertEqual(value,
                       ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"])
    }
}

Tests.defaultTestSuite.run()
