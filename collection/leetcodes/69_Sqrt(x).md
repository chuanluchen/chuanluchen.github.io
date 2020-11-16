---
layout: project
title: '69-Sqrt(x)'
date: 01 July 2020

---
## 题意
> Given a non-negative integer x, compute and return the square root of x.
> Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.

~~~python
Example 1:
Input: x = 4
Output: 2

Example 2:
Input: x = 8
Output: 2
Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
~~~

## 思路
- 数学题: 二分法
- 调库

~~~python
class Solution(object):
    def mySqrt(self, x):
        """
        :type x: int
        :rtype: int
        """
        '''
        1, 2, 3, 4, 5, 6, 7, 8
        low      mid         high
        low   high
           mid
              low
           high
        '''
        if x == 0: return 0
        low, high = 1, x
        while low <= high:
            mid = (high - low) /2  + low
            if mid * mid == x: return mid
            elif mid * mid < x: low = mid + 1
            else: high = mid - 1
        
        # 找不到target: high < target < low
        return high
        
    def mySqrt2(self, x):
        """
        :type x: int
        :rtype: int
        """
        return int(x**0.5)
~~~

## 分析:
- Time: O(logn) 
- Space: O(1) 
