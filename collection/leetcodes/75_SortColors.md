---
layout: project
title: '75-Sort Colors'
date: 01 July 2020

---
## 题意
> Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.
> Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
> Follow up:
> - Could you solve this problem without using the library's sort function?
> - Could you come up with a one-pass algorithm using only O(1) constant space?

~~~python
Example 1:
Input: nums = [2,0,2,1,1,0]
Output: [0,0,1,1,2,2]

Example 2:
Input: nums = [2,0,1]
Output: [0,1,2]

Example 3:
Input: nums = [0]
Output: [0]

Example 4:
Input: nums = [1]
Output: [1]
~~~

## 思路
- 特殊排序
- 三指针: start记录0的位置，end记录2的位置 -> 遇0swap到start, 遇2swap到end

~~~python
class Solution(object):
    def sortColors(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        if not nums: return []
        start, end = 0, len(nums)-1
        i = 0
        while i <= end:
            if nums[i] == 0:
                nums[i],nums[start] = nums[start],nums[i]
                i += 1
                start += 1
            elif nums[i] ==1:
                i += 1
            else:
                nums[i],nums[end] = nums[end],nums[i] #此处不可i++, 否则将未排序元素置换到前面
                end -= 1
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
