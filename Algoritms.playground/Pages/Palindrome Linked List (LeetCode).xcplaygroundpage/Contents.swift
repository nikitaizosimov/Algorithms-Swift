import Foundation
import XCTest

/*:
 # Palindrome Linked List  - EASY
 https://leetcode.com/problems/palindrome-linked-list/
 
 Given the head of a singly linked list, return true if it is a palindrome.
 
 ## Example:
 
 Input: head = [1,2,2,1] \
 Output: true
 
 Input: head = [1,2]
 Output: false
 */

public class ListNode {
    
      var val: Int
      var next: ListNode?
    
      init() {
          self.val = 0
          self.next = nil
      }
    
      init(_ val: Int) {
          self.val = val
          self.next = nil
      }
    
      init(_ val: Int, _ next: ListNode?) {
          self.val = val
          self.next = next
      }
}

class Solution {
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        return false
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    private let aList = ListNode()
    //private let bList = ListNode(1, aList)
    //private let bList = ListNode(2, aList)
    
//    func test0() {
//        let value = solution.canConstruct("aa", "ab")
//        XCTAssertEqual(value, false)
//    }
//
//    func test1() {
//        let value = solution.canConstruct("aa", "aab")
//        XCTAssertEqual(value, true)
//    }
}

Tests.defaultTestSuite.run()
