---
layout: project
title: '81-Search in Rotated Sorted Array II'
date: 01 July 2020

---
## 题意: 
> Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.(i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).
> You are given a target value to search. If found in the array return true, otherwise return false.

~~~python
Example 1:
Input: nums = [2,5,6,0,0,1,2], target = 0
Output: true

Example 2:
Input: nums = [2,5,6,0,0,1,2], target = 3
Output: false
~~~


## 思路
- 二分法查找 + Rotate：元素可以重复
- 左右找的时候，先判断pivot分界点
- 4  5  6  7  0  1  2
- low     mid      high
- 多一种 low = mid = high的情况： 1  1  |1|  3  1 -> 缩小窗口

~~~python
class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: bool
        """
        # 先判断pivot，再判断target
        # 增加一种情况： 1  1  |1|  3  1
        #             left    mid    right 无法判断哪边递增 -> 缩小窗口
        
        left, right = 0, len(nums)-1
        while left <= right:
            mid = left + (right -left) //2
            if target == nums[mid]: return True
            
            # 无法判断的情况
            if nums[left] == nums[mid] and nums[mid] == nums[right]:
                left += 1
                right -= 1
            
            # 左边递增，Pivot在右边
            elif nums[left]<= nums[mid]:
                if target >= nums[left] and target < nums[mid]:
                    right = mid - 1
                else: left = mid + 1
            
            # 右边递增，Pivot在左边
            elif nums[mid]<= nums[right]:
                if target > nums[mid] and target <= nums[right]:
                    left = mid + 1
                else: right = mid - 1
        return False
~~~

## 分析
- Time: O(logn)
- Space：O(1)
