---
layout: project
title: '16-3Sum Closest'
date: 01 July 2020

---
## 题意
> Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

~~~python
Example 1:
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
~~~

## 思路
- 数学题：Sum
- 15.3Sum的简化：Sliding window求和

~~~python
class Solution(object):
    def threeSumClosest(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        res = nums[0] +  nums[1] +  nums[-1]
        # !!!!先sort
        nums.sort()
        
        for i in range(len(nums) - 2):
            left, right = i+1, len(nums)-1
            while left < right:
                sum = nums[i] + nums[left] + nums[right]
                if sum > target:
                    right -= 1
                else: 
                    left += 1
                # 结果更接近，更新res
                if abs(sum-target) < abs(res- target): res = sum
        return res
                
~~~

## 分析:
- Time: O(n^2) 
- Space: O(1) 
