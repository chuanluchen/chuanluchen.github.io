---
layout: project
title: '137-Single Number II'
date: 01 July 2020

---
## 题意
> Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
> Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

~~~python
Example 1:
Input: [2,2,3,2]
Output: 3

Example 2:
Input: [0,1,0,1,0,1,99]
Output: 99
~~~

## 思路
- Set和
- HashMap

~~~python
# 方法1：set
[3(a+b+c) - (a+a+a+b+b+b+c)]/2 = c
class Solution(object):
    def singleNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
       
        return (3*sum(set(nums)) - sum(nums))/2
        
 
# 方法2：HashMap
class Solution(object):
    def singleNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        from collections import defaultdict
        hashmap = defaultdict(int) # 默认为0
        
        for n in nums:
            hashmap[n] += 1
            
        for k in hashmap.keys():
            if hashmap[k] == 1:
                return k
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
