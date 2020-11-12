---
layout: project
title: '154-Find Minimum in Rotated Sorted Array II'
date: 01 July 2020

---
## 题意
> Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
> (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
> Find the minimum element.
> The array may contain duplicates.

~~~python
Example 1:
Input: [1,3,5]
Output: 1

Example 2:
Input: [2,2,2,0,1]
Output: 0
~~~

## 思路
- 二分法查找：找pivot
- 用range写法
- 允许重复元素：缩小窗口

~~~python
class Solution(object):
    def findMin(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        # 二分法找pivot
        # range写法
        # 允许重复：缩小窗口
        if not nums: return None
        left, right = 0, len(nums) - 1
        while left + 1 < right:
            mid = left + (right - left) //2
            if nums[mid] < nums[right]: # 右边递增,Pivot在左边
                right = mid
            elif nums[mid] > nums[right]: left = mid
            else: right -= 1  # 缩小窗口 3，0，1，1，1
        
        # 结果在[left, right]中
        if nums[left] < nums[right]: return nums[left]
        else: return nums[right]
~~~

## 分析:
- Time: O(logn) 
- Space: O(1) 
