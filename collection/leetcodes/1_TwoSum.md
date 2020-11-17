---
layout: project
title: '1-Two Sum'
date: 01 July 2020

---
## 题意
> Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
> You may assume that each input would have exactly one solution, and you may not use the same element twice.
> You can return the answer in any order.

~~~python
Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]
~~~

## 思路
- 数学题
- hashmap {num:index}
- 遍历当前数字n,从HashMap中找target-n

~~~python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        
        map={}
        for i, n in enumerate(nums):
            if target-n in map:
                return [map[target-n], i]
            else:
                map[n] = i
~~~

## 分析:
- Time: O(n) 
- Space: O(n) 
