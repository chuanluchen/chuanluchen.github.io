---
layout: project
title: '259-3 Sum Smaller'
date: 01 July 2020

---
## 题意
> Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.

Follow up: Could you solve it in O(n^2) runtime?

~~~python
Example 1:
Input: nums = [-2,0,1,3], target = 2
Output: 2
Explanation: Because there are two triplets which sums are less than 2:
[-2,0,1]
[-2,0,3]

Example 2:
Input: nums = [], target = 0
Output: 0

Example 3:
Input: nums = [0], target = 0
Output: 0
~~~

## 思路
- 数学题:Sum 
- 3Sum变种

~~~python
class Solution(object):
    def threeSumSmaller(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        # 变种3sum
        res = 0
        if not nums or len(nums) <3: return res
        nums.sort()
        for i in range(len(nums)-2):
            left, right = i+1, len(nums)-1
            while left < right:
                if nums[i] + nums[left] + nums[right] < target:
                    res += right -left  # right -> left之后的right值都符合条件，不必移动right指针
                    left += 1
                else:
                    right -= 1
        return res
~~~

## 分析:
- Time: O(n^2) 
- Space: O(1) 
