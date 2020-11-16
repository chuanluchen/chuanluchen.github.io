---
layout: project
title: '263-Ugly Number'
date: 01 July 2020

---
## 题意
> Write a program to check whether a given number is an ugly number.
> Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.

~~~python
Example 1:
Input: 6
Output: true
Explanation: 6 = 2 × 3

Example 2:
Input: 8
Output: true
Explanation: 8 = 2 × 2 × 2

Example 3:
Input: 14
Output: false 
Explanation: 14 is not ugly since it includes another prime factor 7.
~~~

> Note:
> - 1 is typically treated as an ugly number.
> - Input is within the 32-bit signed integer range: [−231,  231 − 1].

## 思路
- 数学题： 特殊问题
- 能被2, 3, 5整除的情况下，一直除下去
- 处理0,1特殊case

~~~python
class Solution(object):
    def isUgly(self, num):
        """
        :type num: int
        :rtype: bool
        """
        if num ==0: return False
        if num ==1: return True
        while num%2==0: num /= 2
        while num% 3==0: num /= 3
        while num% 5==0: num /= 5
        return num==1
        
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
