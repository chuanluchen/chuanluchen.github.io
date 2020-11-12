---
layout: project
title: '191-Number of 1 Bits'
date: 01 July 2020

---
## 题意
> Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).

~~~python
Example 1:
Input: n = 00000000000000000000000000001011
Output: 3
Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.

Example 2:
Input: n = 00000000000000000000000010000000
Output: 1
Explanation: The input binary string 00000000000000000000000010000000 has a total of one '1' bit.

Example 3:
Input: n = 11111111111111111111111111111101
Output: 31
Explanation: The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.
~~~

## 思路
- 位运算：按位与
- 相邻数字按位与：将末位的1改为0
- bin()转换为二进制，count '1'的个数

~~~python
class Solution(object):
    def hammingWeight(self, n):
        """
        :type n: int
        :rtype: int
        """
        res = 0
        while n != 0:
            n &= (n-1)
            res += 1
        return res
        
    def hammingWeight2(self, n):
        return bin(n).count('1')
~~~

## 分析:
- Time: O(n) 位数
- Space: O(1) 
