---
layout: project
title: '7-Reverse Integer'
date: 01 July 2020

---
## 题意
> Given a 32-bit signed integer, reverse digits of an integer.
> Note: Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

~~~python
Example 1:
Input: x = 123
Output: 321

Example 2:
Input: x = -123
Output: -321

Example 3:
Input: x = 120
Output: 21

Example 4:
Input: x = 0
Output: 0
~~~

## 思路
- 方法1：数学题-数位反转
  - 考虑符号，range问题
- 方法2：当成字符串处理

~~~python
class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        res = 0
        # 1.sign
        sign = 1 if x > 0 else -1
        x = abs(x)
        
        # 2.reverse digits
        while x !=0:
            res = res * 10 + x % 10
            x //= 10
            
        # 3.range
        if res  > 2**31-1 or res <  -2**31: return 0
        
        return sign * res
        
      def reverse(self, x):
          """
          :type x: int
          :rtype: int
          """
          res = int(str(x)[::-1]) if x>0 else -int(str(-x)[::-1])
          return res if res>-2**31 and res< 2**31-1 else 0
~~~

## 分析:
- Time: O(logn)  遍历数字位数
- Space: O(1) 
