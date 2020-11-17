---
layout: project
title: '172-Factorial Trailing Zeroes'
date: 01 July 2020

---
## 题意
> Given an integer n, return the number of trailing zeroes in n!.
> Follow up: Could you write a solution that works in logarithmic time complexity?

~~~python
Example 1:
Input: n = 3
Output: 0
Explanation: 3! = 6, no trailing zero.

Example 2:
Input: n = 5
Output: 1
Explanation: 5! = 120, one trailing zero.

Example 3:
Input: n = 0
Output: 0

~~~

## 思路
- 数学题：特殊问题

~~~python
class Solution(object):
    def trailingZeroes(self, n):
        """
        :type n: int
        :rtype: int
        """
        '''
        10！ = 10*9*8*7*6*5...*2*1
            = 2*5        5
        出现0的次数取决于出现5、2的次数： min(5, 2)
        2出现多 -> 题目转化为统计因数中5出现的次数
        '''
        
        res = 0
        while n>4:
            res += n//5
            n //= 5
        return res
~~~

## 分析:
- Time: O(logn) 
- Space: O(1) 
