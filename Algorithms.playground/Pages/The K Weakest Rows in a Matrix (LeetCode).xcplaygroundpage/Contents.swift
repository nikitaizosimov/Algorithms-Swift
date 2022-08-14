import Foundation
import XCTest

/*:
 # The K Weakest Rows in a Matrix  - EASY
 https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/
 
 You are given an m x n binary matrix mat of 1's (representing soldiers) and 0's (representing civilians). The soldiers are positioned in front of the civilians. That is, all the 1's will appear to the left of all the 0's in each row.
 
 Return the indices of the k weakest rows in the matrix ordered from weakest to strongest.
 
 ## Example:
 
 Input: mat = [[1,1,0,0,0], [1,1,1,1,0], [1,0,0,0,0], [1,1,0,0,0], [1,1,1,1,1]]
 k = 3
 Output: [2,0,3]
 
 Input: mat = [[1,0,0,0], [1,1,1,1], [1,0,0,0], [1,0,0,0]]
 k = 2
 Output: [0,2]
 
 Input: mat = [[1,0,1,1], [1,0,0,1], [1,0,0,0]]
 k = 2
 Output: [1,2]
 */

class Solution {
    
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        mat.map { $0.reduce(0) { $0 + $1 } }
            .enumerated().map { ($0, $1) }
            .sorted { $0.1 < $1.1 }
            .prefix(k)
            .map { $0.0 }
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let mat = [[1,1,0,0,0], [1,1,1,1,0], [1,0,0,0,0], [1,1,0,0,0], [1,1,1,1,1]]
        let value = solution.kWeakestRows(mat, 3)
        XCTAssertEqual(value, [2,0,3])
    }
    
    func test1() {
        let mat = [[1,0,0,0], [1,1,1,1], [1,0,0,0], [1,0,0,0]]
        let value = solution.kWeakestRows(mat, 2)
        XCTAssertEqual(value, [0,2])
    }
    
    func test2() {
        let mat = [[1,0,1,1], [1,0,0,1], [1,0,0,0]]
        let value = solution.kWeakestRows(mat, 2)
        XCTAssertEqual(value, [2,1])
    }
}

Tests.defaultTestSuite.run()
