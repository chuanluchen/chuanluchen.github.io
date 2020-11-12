---
layout: project
title: '268-Missing Number'
date: 01 July 2020

---
## 题意
> Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
> Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?

~~~python
Example 1:
Input: nums = [3,0,1]
Output: 2
Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

Example 2:
Input: nums = [0,1]
Output: 2
Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.

Example 3:
Input: nums = [9,6,4,2,3,5,7,0,1]
Output: 8
Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.

Example 4:
Input: nums = [0]
Output: 1
Explanation: n = 1 since there is 1 number, so all numbers are in the range [0,1]. 1 is the missing number in the range since it does not appear in nums.
~~~

## 思路
- 位运算：异或找唯一
- len, i, nums[i]三者异或

~~~python
class Solution(object):
    def missingNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        # 3, 0, 1
        # 0, 1, 2, 3
        res = len(nums)
        for i in range(len(nums)):
            res ^= i ^ nums[i]
        return res
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
