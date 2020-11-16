---
layout: project
title: '29-Divide Two Integers'
date: 01 July 2020

---
## 题意
> Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.
> Return the quotient after dividing dividend by divisor.
> The integer division should truncate toward zero, which means losing its fractional part. For example, truncate(8.345) = 8 and truncate(-2.7335) = -2.
> Note:
> - Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. 
> - For this problem, assume that your function returns 231 − 1 when the division result overflows.

~~~python
Example 1:
Input: dividend = 10, divisor = 3
Output: 3
Explanation: 10/3 = truncate(3.33333..) = 3.

Example 2:
Input: dividend = 7, divisor = -3
Output: -2
Explanation: 7/-3 = truncate(-2.33333..) = -2.

Example 3:
Input: dividend = 0, divisor = 1
Output: 0

Example 4:
Input: dividend = 1, divisor = 1
Output: 1
~~~

## 思路
- 数学题：用减法做除法

~~~python
class Solution(object):
    def divide(self, dividend, divisor):
        """
        :type dividend: int
        :type divisor: int
        :rtype: int
        """
        
        '''
        除法转化为减法：每次从dividend减去divisor，count次数
        20/3
        20-3 = 17   1
        17-3 = 14   1
        14-3 = 11   1
        11-3 = 8    1
        8-3 = 5     1
        5-3 = 2     1
        
        ==>简化：每次divisor翻倍，count翻倍，对剩余部分递归
        20-3 = 17   1
        17-6 = 11   2
        11-12  XXXX
        11-3 = 8    1
        8-6  = 2    2
        
        '''
        def divide_helper(dividend, divisor):
            if dividend < divisor: return 0
            multidivisor, multi = divisor, 1
            # multidivor:divisor每次翻倍， multi记录翻倍的结果
            while multidivisor + multidivisor <= dividend:
                multidivisor += multidivisor
                multi += multi
                        # 对剩余部分递归
            return multi + divide_helper(dividend - multidivisor, divisor)
        
        # 处理符号
        sign = 1
        if (dividend >0 and divisor<0) or (dividend <0 and divisor>0): sign = -1
        dividend, divisor = abs(dividend), abs(divisor)
        # 简化除法
        res = divide_helper(dividend, divisor) 
        res = res * sign
        return res if res>= -2**31 and res<= 2**31-1 else 2**31-1
~~~

## 分析:
- Time: O(logn)  相当于每次进行一个/2的操作
- Space: O(logn) 递归
