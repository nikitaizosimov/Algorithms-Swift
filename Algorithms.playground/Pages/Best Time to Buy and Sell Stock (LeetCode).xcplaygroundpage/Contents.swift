import Foundation
import XCTest

/*:
 #  Best Time to Buy and Sell Stock - EASY
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 
 ## Example:
 
 Input: prices = [7,1,5,3,6,4] \
 Output: 5
 
 Input: prices = [7,6,4,3,1] \
 Output: 0
 
 Input: prices = [2,4,1] \
 Output: 2
 */

class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard let firstPrice = prices.first else { return 0 }
        
        var profit = 0
        var minPrice = firstPrice
        
        for (index, price) in prices.enumerated() {
            guard index != 0 else { continue }
            
            if minPrice > price {
                minPrice = price
            } else {
                let currentProfit = price - minPrice
                
                if profit < currentProfit {
                    profit = currentProfit
                }
            }
        }
        
        return profit
    }
}

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.maxProfit([7,1,5,3,6,4])
        XCTAssertEqual(value, 5)
    }
    
    func test1() {
        let value = solution.maxProfit([7,6,4,3,1])
        XCTAssertEqual(value, 0)
    }
    
    func test2() {
        let value = solution.maxProfit([2,4,1])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
