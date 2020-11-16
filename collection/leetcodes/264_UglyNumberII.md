---
layout: project
title: '264-Ugly Number II'
date: 01 July 2020

---
## 题意
> Write a program to find the n-th ugly number.
> Ugly numbers are positive numbers whose prime factors only include 2, 3, 5. 

~~~python
Example:
Input: n = 10
Output: 12
Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
~~~

> Note:  
> - 1 is typically treated as an ugly number.
> - n does not exceed 1690.

## 思路
- 数学题：特殊问题

~~~python
class Solution(object):
    def nthUglyNumber(self, n):
        """
        :type n: int
        :rtype: int
        """
        '''
        1, 2, 3, 4, 5, 6, 8, 9, 10, 12
        1  2  3     5
                2*2    2*3      2*5
                       3*2  3*3
                          4*2    4*3
        丑数由前面的丑数*2/3/5，从小到大排列得到
        '''
        nums = [1] * n
        
        index2 = index3 = index5 = 0
        
        for i in range(1, n):
            # 当前的丑数由前面某个丑数分别* 2/3/5,取最小值
            nums[i] = min(nums[index2] * 2, nums[index3]*3, nums[index5]*5)
            if nums[i] == nums[index2] * 2:index2 += 1
            if nums[i] == nums[index3] * 3:index3 += 1
            if nums[i] == nums[index5] * 5:index5 += 1
        return nums[-1]
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
