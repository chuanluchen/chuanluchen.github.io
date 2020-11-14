---
layout: project
title: '89-Gray Code'
date: 01 July 2020

---
## 题意
> The gray code is a binary numeral system where two successive values differ in only one bit.
> Given a non-negative integer n representing the total number of bits in the code, print the sequence of gray code. A gray code sequence must begin with 0.

~~~python
Example 1:
Input: 2
Output: [0,1,3,2]
Explanation:
00 - 0
01 - 1
11 - 3
10 - 2
For a given n, a gray code sequence may not be uniquely defined.
For example, [0,2,3,1] is also a valid gray code sequence.
00 - 0
10 - 2
11 - 3
01 - 1

Example 2:
Input: 0
Output: [0]
Explanation: We define the gray code sequence to begin with 0.
             A gray code sequence of n has size = 2n, which for n = 0 the size is 20 = 1.
             Therefore, for n = 0 the gray code sequence is [0].
~~~

## 思路
- 格雷码公式 G(i) = i^(i/2)
- 位运算 + 动态规划

~~~python
class Solution(object):
    def grayCode(self, n):
        """
        :type n: int
        :rtype: List[int]
        """
        # G(i) = i^(i/2)
        
        dp = [0 for _ in range(2**n)]
        for i in range(1, 2**n): # 第1位是0， 后面每一位更改一位
            dp[i] = i^(i/2) 
        return dp
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
