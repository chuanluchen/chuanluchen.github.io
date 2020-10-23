---
layout: project
title: '55-Jump Game'
date: 01 July 2020

---
## 题意
> Given an array of non-negative integers, you are initially positioned at the first index of the array.
> Each element in the array represents your maximum jump length at that position.
> Determine if you are able to reach the last index.

~~~python
Example 1:
Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

Example 2:
Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
~~~

> Constraints:
> - 1 <= nums.length <= 3 * 10^4
> - 0 <= nums[i][j] <= 10^5

## 思路
- 贪心算法
- 不考虑最终能不能走到终点
- 只考虑局部最优：前面index能走的最大距离max能不能接上当前i

~~~python
class Solution(object):
    def canJump(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        # 
        
        max_step = 0
        for i in range(len(nums)):
            if max_step < i: # 断开了，接不上
                return False
            
            # 更新max_step
            max_step =  max(i + nums[i], max_step)
            
        return True
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
