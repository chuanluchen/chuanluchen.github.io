---
layout: project
title: '167-Two Sum II：Input array is sorted'
date: 01 July 2020

---
## 题意
> Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
> The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
> Note:
> - Your returned answers (both index1 and index2) are not zero-based.
> - You may assume that each input would have exactly one solution and you may not use the same element twice.

~~~python
Example 1:
Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.

Example 2:
Input: numbers = [2,3,4], target = 6
Output: [1,3]

Example 3:
Input: numbers = [-1,0], target = -1
Output: [1,2]
~~~

## 思路
- 数学题： sum
- 已排序序列：用二分法求和
- 判断sum与target的关系

~~~python
class Solution(object):
    def twoSum(self, numbers, target):
        """
        :type numbers: List[int]
        :type target: int
        :rtype: List[int]
        """
        # 已排序：
        
        if not numbers or len(numbers) < 2: return [-1,-1]
        
        left, right = 0, len(numbers)-1
        while left < right:
            sum = numbers[left] + numbers[right]
            if sum == target: return [left+1, right+1]
            elif sum < target: left += 1
            else: right -= 1
        return [-1,-1]
~~~

## 分析:
- Time: O(n)  
- Space: O(1) 
