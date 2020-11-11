---
layout: project
title: '162-Find Peak Element'
date: 01 July 2020

---
## 题意
> A peak element is an element that is greater than its neighbors.
> Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.
> The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
> You may imagine that nums[-1] = nums[n] = -∞.
> Follow up: Your solution should be in logarithmic complexity.

~~~python
Example 1:
Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.

Example 2:
Input: nums = [1,2,1,3,5,6,4]
Output: 1 or 5 
Explanation: Your function can return either index number 1 where the peak element is 2, 
             or index number 5 where the peak element is 6.
~~~

## 思路
- 二分法查找：range写法
- 找peak
- 最后判断peak的位置[left, right] 

~~~python
class Solution(object):
    def findPeakElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        # 二分法找range
        # 找Peak，判断条件nums[mid] > nums[mid + 1]:往左找，else往右找
        # 最后判断left, right哪个大
        if not nums: return -1
        left, right = 0, len(nums)-1
        while left + 1 < right:
            mid = left + (right-left)//2
            if nums[mid] > nums[mid + 1]: right = mid
            else: left = mid
        # 最后peak在[left, right]中
        if nums[left] > nums[right]: return left
        else: return right
   
~~~

## 分析:
- Time: O(logn) 
- Space: O(1) 
