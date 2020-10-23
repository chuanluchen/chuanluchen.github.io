---
layout: project
title: '45-Jump Game II'
date: 01 July 2020

---
## 题意
> Given an array of non-negative integers nums, you are initially positioned at the first index of the array.
> Each element in the array represents your maximum jump length at that position.
> Your goal is to reach the last index in the minimum number of jumps.
> You can assume that you can always reach the last index.

~~~python
Example 1:
Input: nums = [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.

Example 2:
Input: nums = [2,3,0,1,4]
Output: 2
~~~

> Constraints:
> - 1 <= nums.length <= 3 * 10^4
> - 0 <= nums[i][j] <= 10^5

## 思路
- 贪心算法
- 之前能走的最远距离能不能接上当前的i
- 如果能接上，更新能走的最远距离，count++

~~~python
class Solution(object):
    def jump(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """       
        if not nums or len(nums) < 2: return 0
        count = 0
        max_step = 0 # 之前能走的最远距离 
        cur_step = 0 # 当前这步的最远距离
        for i in range(len(nums) -1): # 走到最后一步结束，最后一个不用找
            cur_step = max(cur_step, i + nums[i]) # 上一个cur_step与当前的最大值
            if max_step == i: # 如果接上就更新，接不上不更新
                count += 1
                max_step = cur_step
        return count
                
~~~

## 分析:
- Time: O(n) 
- Space: O(1) 
