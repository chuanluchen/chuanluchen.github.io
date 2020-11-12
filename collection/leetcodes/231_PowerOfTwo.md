---
layout: project
title: '231-Power of Two'
date: 01 July 2020

---
## 题意
> Given an integer n, return true if it is a power of two. Otherwise, return false.
> An integer n is a power of two, if there exists an integer x such that n == 2^x.

~~~python
Example 1:
Input: n = 1
Output: true
Explanation: 2^0 = 1

Example 2:
Input: n = 16
Output: true
Explanation: 2^4 = 16

Example 3:
Input: n = 3
Output: false

Example 4:
Input: n = 4
Output: true

Example 5:
Input: n = 5
Output: false
~~~

## 思路
- 位运算：n&(n-1) ==0 判断2的整数次幂

~~~python
class Solution(object):
    def isPowerOfTwo(self, n):
        """
        :type n: int
        :rtype: bool
        """
        if n <= 0: return False
        return n & (n-1)==0
~~~

## 分析:
- Time: O(1) 
- Space: O(1) 
