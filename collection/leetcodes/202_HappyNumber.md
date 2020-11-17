---
layout: project
title: '202-Happy Number'
date: 01 July 2020

---
## 题意
> Write an algorithm to determine if a number n is "happy".
> A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
> Return True if n is a happy number, and False if not.

~~~python
Example: 
Input: 19
Output: true
Explanation: 
12 + 92 = 82
82 + 22 = 68
62 + 82 = 100
12 + 02 + 02 = 1
~~~

## 思路
- 数学题：暴力实现

~~~python
class Solution(object):
    def isHappy(self, n):
        """
        :type n: int
        :rtype: bool
        """
        count = 0
        l = []
       
        while n != 1:  # ==1 return True
            l.append(n)
            temp = 0            
            # 各数位平方和相加
            while n>0:
                temp +=(n%10)**2
                n/=10
            n = temp
            if n in l: return False # 陷入循环
        
        return True
~~~

## 分析:
- Time: 不确定
- Space: O(n) 
