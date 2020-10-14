---
layout: project'
title: '31-Next Permutation'
date: 01 July 2020

---
## 题意: 
**找比当前组合大的那个最小的组合**
> Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
> If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).
> The replacement must be in place and use only constant extra memory.
> Example 1:
> - Input: nums = [1,2,3]
> - Output: [1,3,2]
> 
> Example 2:
> - Input: nums = [3,2,1]
> - Output: [1,2,3]
> 
> Example 3:
> - Input: nums = [1,1,5]
> - Output: [1,5,1]
>
> Example 4:
> - Input: nums = [1]
> - Output: [1]
>
> Constraints:
> - 1 <= nums.length <= 100
> - 0 <= nums[i] <= 100
## 思路
- 把当前组合理解为一个非递减序列
- 重点找两个位置: peak的前一个数i-1，和序列中比这个数略大的一个数j
<img src= '/assets/img/projects/code/31_NextPermutation.jpeg'>

~~~python
class Solution(object):
    def nextPermutation(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        l = len(nums)
        # 找i
        for i in range(l-1, -1, -1):
            if nums[i - 1] < nums[i]:
                break
                
        # 没有i-1: 整体反转
        if i == 0: # 代表当前不存在下一个更大的序列，整体翻转即可
            nums[:] = nums[::-1]
            return nums
        
        # 找j
        for j in range(l-1, i-1, -1):
            if nums[j] > nums[i-1]: 
                break
    
        # swap i-1, j
        nums[i-1], nums[j] = nums[j], nums[i-1]
        
        # 后半部分升序排列
        nums[i:] = nums[i:][::-1]
        return nums
~~~

## 分析
- Time: O(n) 最坏情况遍历一遍
- Space：O(1)
