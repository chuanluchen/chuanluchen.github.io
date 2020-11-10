---
layout: project
title: '35-Search Insert Position'
date: 01 July 2020

---
## 题意: 
>Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

~~~python
Example 1:
Input: nums = [1,3,5,6], target = 5
Output: 2

Example 2:
Input: nums = [1,3,5,6], target = 2
Output: 1

Example 3:
Input: nums = [1,3,5,6], target = 7
Output: 4

Example 4:
Input: nums = [1,3,5,6], target = 0
Output: 0

Example 5:
Input: nums = [1], target = 0
Output: 0
~~~


## 思路
- 二分法查找

~~~python
class Solution(object):
    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        left, right = 0, len(nums)-1
        while left <= right:
            mid = left +(right - left) //2
            if target == nums[mid]: return mid
            elif target < nums[mid]: right = mid-1
            else: left = mid + 1
        return left
~~~

## 分析
- Time: O(logn)
- Space：O(1)
