---
layout: project
title: '122-Best Time to Buy and Sell Stock II'
date: 01 July 2020

---
## 题意
> Say you have an array prices for which the ith element is the price of a given stock on day i.
> Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
> Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

~~~python
Example 1:
Input: [7,1,5,3,6,4]
Output: 7
Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
             Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.

Example 2:
Input: [1,2,3,4,5]
Output: 4
Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
             Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
             engaging multiple transactions at the same time. You must sell before buying again.
~~~

## 思路
- 只能一个交易进行中
- 贪心算法: 能赚一点十一点
- 只要当天相对于前一天上涨了 ->就前一天买入，当天卖出

~~~python
class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        # 只能一个交易进行中
        # 贪心算法
        # 只要当天相对于前一天上涨了 ->就前一天买入，当天卖出
        if not prices or len(prices) < 2: return 0
        profit = 0
        
        for i in range(1,len(prices)): # 注意从第二天开始比较
            if prices[i] > prices[i-1]:
                profit += prices[i] - prices[i-1]
        
        return profit
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
