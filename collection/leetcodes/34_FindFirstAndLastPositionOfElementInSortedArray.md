---
layout: project
title: '34-Find First and Last Position of Element in Sorted Array'
date: 01 July 2020

---
## 题意: 
> Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
> If target is not found in the array, return [-1, -1].
> Follow up: Could you write an algorithm with O(log n) runtime complexity?

~~~python
Example 1:
Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]

Example 2:
Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

Example 3:
Input: nums = [], target = 0
Output: [-1,-1]
~~~


## 思路
- 二分法查找 + range查找
- 先找一遍：第一个
- 再找一遍: 最后一个
- 注意查/输出顺序


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
