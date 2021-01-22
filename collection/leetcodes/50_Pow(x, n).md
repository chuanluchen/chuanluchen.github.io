---
layout: project
title: '50-Pow(x, n)'
date: 01 July 2020

---
## 题意
> Implement pow(x, n), which calculates x raised to the power n (i.e. x^n).

~~~python
Example 1:
Input: x = 2.00000, n = 10
Output: 1024.00000

Example 2:
Input: x = 2.10000, n = 3
Output: 9.26100

Example 3:
Input: x = 2.00000, n = -2
Output: 0.25000
Explanation: 2^-2 = 1/2^2 = 1/4 = 0.25
~~~

## 思路
- 数学题： 幂
- 分奇、偶次幂讨论

~~~python
# 递归版本
class Solution(object):
    def myPow(self, x, n):
        """
        :type x: float
        :type n: int
        :rtype: float
        """
        def helper(x, n):
            if n==0: return 1
            half = helper(x, n//2)
            if n%2==0: return half*half
            else: return half* half* x
        
        if n>0: return helper(x, n)
        else: return 1.0/helper(x, -n)
        

# 迭代版本
class Solution(object):
    def myPow(self, x, n):
        """
        :type x: float
        :type n: int
        :rtype: float
        """
        '''
        偶数次幂 x^n = x^(n/2) * x^(n/2)
        
        奇数次幂 x^n = x^(n/2) * x^(n/2) * x
        
        2 ^ 2  
        = 2^1 * 2^1 = (2^0 * 2^0 * 2) *(2^0 * 2^0 * 2) 
        = (1 * 1 * 2)* (1 * 1 * 2) = 4
        
        2 ^ 3  
        = 2^1 * 2^1 * 2 = (2^0 * 2^0 * 2) *(2^0 * 2^0 * 2) * 2
        = (1 * 1 * 2)* (1 * 1 * 2) *2= 4*2 = 8
        
        '''
        
        res = 1.0
        i = abs(n) # 取正数次幂
        while i>0:
            if i %2 !=0: res = res * x
            x = x * x
            i = i // 2
            
        return res if n >0 else 1.0/res
~~~

## 分析:
- Time: O(logn)   O(logn) 
- Space:O(logn)   O(1) 
