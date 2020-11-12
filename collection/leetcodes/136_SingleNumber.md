---
layout: project
title: '136-Single Number'
date: 01 July 2020

---
## 题意
> Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
> Follow up: Could you implement a solution with a linear runtime complexity and without using extra memory?

~~~python
Example 1:
Input: nums = [2,2,1]
Output: 1

Example 2:
Input: nums = [4,1,2,1,2]
Output: 4

Example 3:
Input: nums = [1]
Output: 1
~~~

## 思路
- 位运算：异或找唯一元素
- 2(a + b + c) - (a + a + b + b + c) = c

~~~python
class Solution(object):
    def singleNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        res = 0
        for i in nums:
            res ^= i
        return res
        
     def singleNumber2(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        return 2*sum(set(nums)) - sum(nums)
~~~

## 分析:
- Time: O(n)   O(1)
- Space: O(1)    O(n)
