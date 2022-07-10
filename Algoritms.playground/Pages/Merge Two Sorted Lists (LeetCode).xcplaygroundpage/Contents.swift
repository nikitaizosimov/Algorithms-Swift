import Foundation
import XCTest

/*:
 # Merge Two Sorted Lists  - EASY
 https://leetcode.com/problems/merge-two-sorted-lists/
 
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.
 
 ## Example:
 
 Input: list1 = [1,2,4], list2 = [1,3,4] \
 Output: [1,1,2,3,4,4]
 
 Input: list1 = [], list2 = [] \
 Output: []
 
 Input: list1 = [], list2 = [0] \
 Output: [0]
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
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2 }
        
        guard let list2 = list2 else { return nil }
        
        var firstList: ListNode? = list1.val < list2.val ? list1 : list2
        var secondList: ListNode? = list1.val < list2.val ? list2 : list1
        
        while secondList != nil {
            
            while firstList!.next != nil {
                if secondList!.val <= firstList!.next!.val {
                    let temp = firstList!.next
                    firstList!.next = secondList
                    secondList = temp
                }
                
                firstList = firstList!.next
            }
            
            if firstList!.next == nil {
                firstList?.next = secondList
                break
            }
            
            secondList = secondList?.next
        }
        
        return list1.val < list2.val ? list1 : list2
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    private let aList = ListNode(1)
    private let bList = ListNode(2)
    private let cList = ListNode(4)
    
    private let dList = ListNode(1)
    private let eList = ListNode(3)
    private let fList = ListNode(4)
    
    private func makeBinding() {
        aList.next = bList
        bList.next = cList
        
        dList.next = eList
        eList.next = fList
    }
    
    private func listValues(_ list: ListNode) -> [Int] {
        var output = [Int]()
        var currentList: ListNode? = list
        
        while let list = currentList {
            output.append(list.val)
            currentList = list.next
        }
        
        return output
    }
    
    func test0() {
        makeBinding()
        let list = solution.mergeTwoLists(aList, dList)
        XCTAssertEqual(listValues(list!), [1, 1, 2, 3, 4, 4])
    }
}

Tests.defaultTestSuite.run()
