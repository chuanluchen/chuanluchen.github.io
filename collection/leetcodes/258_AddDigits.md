---
layout: project
title: '258-Add Digits'
date: 01 July 2020

---
## 题意
> Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

~~~python
Example:
Input: 38
Output: 2 
Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. 
             Since 2 has only one digit, return it.
~~~

## 思路
- 数位相加 + 暴力找规律

~~~python
class Solution(object):
    def addDigits(self, num):
        """
        :type num: int
        :rtype: int
        """
        # 找规律：每9个数循环一次
        # 10 11 12 13 14 15 16 17 18 19 20
        #  1  2  3  4  5  6  7  8  9  1  2
        
        if num ==0: return 0
        if num % 9 ==0: return 9
        return num % 9
~~~

## 分析:
- Time: O(1) 
- Space: O(1) 
