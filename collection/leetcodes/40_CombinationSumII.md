---
layout: project
title: '40-Combination Sum II'
date: 01 July 2020
kramdown:
    math_engine: mathjax 
    math_engine_opts:
        preview:true
        preview_as_code:true 
       
---
## 题意: 
> Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
> Each number in candidates may only be used once in the combination.
> Note:
> - All numbers (including target) will be positive integers.
> - The solution set must not contain duplicate combinations.
>
> Example 1:
> - Input: candidates = [10,1,2,7,6,1,5], target = 8,
> - A solution set is:
> [
>   [1, 7],
>   [1, 2, 5],
>   [2, 6],
>  [1, 1, 6]
> ]
>
> Example 2:
> - Input: candidates = [2,5,2,1,2], target = 5,
> A solution set is:
> [
>   [1,2,2],
>   [5]
> ]

## 思路
- 回溯法
- 结果需要满足sum条件：用target
- 结果中不能有重复组合：用index控制，每次递归+1
- 每个元素用一次：先排序，遇重复元素跳过

~~~python
class Solution(object):
    def combinationSum2(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        res = []
        if not candidates or target == 0: return res
        candidates.sort()
        
        
        def backtrack(res, temp, nums, target, index):
            if target < 0: return
            if target == 0:
                res.append(temp[:])
                return
            
            for i in range(index, len(nums)):
                if i > index and nums[i] == nums[i-1]: continue
                
                temp.append(nums[i])
                backtrack(res, temp, nums, target - nums[i], i + 1)
                temp.pop()

        backtrack(res, [], candidates, target, 0)
        return res
            
~~~
