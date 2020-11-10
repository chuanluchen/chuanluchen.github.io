---
layout: project
title: '33-Search in Rotated Sorted Array'
date: 01 July 2020

---
## 题意: 
> You are given an integer array nums sorted in ascending order, and an integer target.
> Suppose that nums is rotated at some pivot unknown to you beforehand (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
> If target is found in the array return its index, otherwise, return -1.

~~~python
Example 1:
Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4

Example 2:
Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1

Example 3:
Input: nums = [1], target = 0
Output: -1
~~~


## 思路
- 二分法查找 + Rotate：元素不重复
- 左右找的时候，先判断pivot分界点

~~~python
class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        left,right = 0, len(nums)-1
        while left <= right:
            mid = left + (right - left) //2
            if target == nums[mid]: return mid
            
            # 左边递增，Pivot在右边
            if nums[left] <= nums[mid]:
                # 左右找
                if target >= nums[left] and target < nums[mid]:
                    right = mid-1
                else: left = mid + 1
            
            # 右边递增，Pivot在左边
            if nums[mid] <= nums[right]:
                if target > nums[mid] and target <= nums[right]:
                    left = mid +1
                else: right = mid - 1
        return -1
~~~

## 分析
- Time: O(logn)
- Space：O(1)
