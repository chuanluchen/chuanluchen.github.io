---
layout: project
title: '204-Count Primes'
date: 01 July 2020

---
## 题意
> Count the number of prime numbers less than a non-negative number, n.

~~~python
Example 1:

Input: n = 10
Output: 4
Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.

Example 2:
Input: n = 0
Output: 0

Example 3:
Input: n = 1
Output: 0
~~~

## 思路
- 数学题: 找质数
- 特殊方法

~~~python
class Solution(object):
    def countPrimes(self, n):
        """
        :type n: int
        :rtype: int
        """
        '''
        - 把所有数字先当成质数
        - 从2开始遍历
        - 把合数标记出来：质数的倍数都是合数
        
        '''
        res = 0
        prime = [True] * n
        
        for i in range(2, n):
            if prime[i] == True:
                res += 1
                for j in range(i * 2, n, i): # 遍历质数的倍数
                    prime[j] = False
        return res
~~~

## 分析:
- Time: O(nsqrt(n))
- Space: O(n) 
