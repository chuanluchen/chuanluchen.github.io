---
layout: project
title: '90-Subsets II'
date: 01 July 2020
kramdown:
    math_engine: mathjax 
    math_engine_opts:
        preview:true
        preview_as_code:true 
       
---
## 题意: 
**找比当前组合大的那个最小的组合**
> Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).
> Note: The solution set must not contain duplicate subsets.
> Example:
> - Input: [1,2,2]
> - Output:
> [
>   [2],
>   [1],
>   [1,2,2],
>   [2,2],
>   [1,2],
>   []
> ]

## 思路
- 回溯法
- 备选元素有重复：用used boolean数组控制
- 结果中不能有重复：不走重复路线，用index控制

~~~python
class Solution(object):
    def subsetsWithDup(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        res = []      
        if not nums: return res
        nums.sort()
        
        def backtrack(res, temp, nums, used, index):
            res.append(temp[:])
            
            for i in range(index, len(nums)): # 此处易错，务必用上index
                if used[i]: continue
                if (i > 0 and nums[i] == nums[i-1] and not used[i-1]): continue
                temp.append(nums[i])
                used[i] = True
                backtrack(res, temp, nums, used, i+1)
                used[i] = False
                temp.pop()
                
        used = [False] * len(nums)
        backtrack(res, [], nums, used, 0)
        return res
~~~

## 分析
- Time: O（$$ 2^n $$）
- Space：O(n)
