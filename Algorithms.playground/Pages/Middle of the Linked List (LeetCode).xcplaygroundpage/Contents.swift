import Foundation
import XCTest

/*:
 # Middle of the Linked List  - EASY
 https://leetcode.com/problems/middle-of-the-linked-list/
 
 Given the head of a singly linked list, return the middle node of the linked list.
 If there are two middle nodes, return the second middle node.
 
 ## Example:
 
 Input: head = [1,2,3,4,5] \
 Output: [3,4,5]
 
 Input: head = [1,2,3,4,5,6] \
 Output: [4,5,6]
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
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slowNode = head
        var fastNode = head
        
        while fastNode?.next != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next
        }
        
        return slowNode
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    private let aList = ListNode(1)
    private let bList = ListNode(2)
    private let cList = ListNode(3)
    private let dList = ListNode(4)
    private let eList = ListNode(5)
    private let fList = ListNode(6)
    
    private func makeBinding() {
        aList.next = bList
        bList.next = cList
        cList.next = dList
        dList.next = eList
        eList.next = fList
    }
    
    func test0() {
        makeBinding()
        guard let value = solution.middleNode(aList) else { return }
        
        XCTAssertEqual(value === dList, true)
    }
    
    func test1() {
        makeBinding()
        eList.next = nil
        let value = solution.middleNode(aList)
        XCTAssertEqual(cList === value, true)
    }
}

Tests.defaultTestSuite.run()
