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

class ListNode {
    
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
        var array = [Int]()
        var currentList = head
        
        while let list = currentList {
            array.append(list.val)
            currentList = list.next
        }
        
        return Array(array.prefix(array.count / 2)) == Array(array.suffix(array.count / 2).reversed())
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    private let aList = ListNode(1)
    private let bList = ListNode(2)
    private let cList = ListNode(2)
    private let dList = ListNode(1)
    
    private func makeBinding() {
        aList.next = bList
        bList.next = cList
        cList.next = dList
    }
    
    func test0() {
        makeBinding()
        let value = solution.isPalindrome(aList)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        makeBinding()
        let value = solution.isPalindrome(bList)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
