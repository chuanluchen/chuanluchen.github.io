---
layout: project
title: '39-Combination Sum'
date: 01 July 2020
kramdown:
    math_engine: mathjax 
    math_engine_opts:
        preview:true
        preview_as_code:true 
       
---
## 题意: 
> Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.
> The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.
> It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.
> Example 1:
> - Input: candidates = [2,3,6,7], target = 7
> - Output: [[2,2,3],[7]]
> - Explanation:
>   - 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
>   - 7 is a candidate, and 7 = 7.
>   - These are the only two combinations.
>
> Example 2:
> - Input: candidates = [2,3,5], target = 8
> - Output: [[2,2,2,2],[2,3,3],[3,5]]
>
> Example 3:
> - Input: candidates = [2], target = 1
> - Output: []
>
> Example 4:
> - Input: candidates = [1], target = 1
> - Output: [[1]]
>
> Example 5:
> - Input: candidates = [1], target = 2
> - Output: [[1,1]]
> 
> Constraints:
> - 1 <= candidates.length <= 30
> - 1 <= candidates[i] <= 200
> - All elements of candidates are distinct.
> - 1 <= target <= 500

## 思路
- 回溯法
- 结果需要满足sum条件：用target
- 结果中不能有重复组合：用index控制，但可以有重复元素，index不增加

~~~python
class Solution(object):
    def combinationSum(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        res = []
        if not candidates or target == 0: return res
        
        def backtrack(res, temp, nums, target, start):
            if target < 0: return
            if target == 0:
                res.append(temp[:])
                return
            
            for i in range(start, len(nums)):
                temp.append(nums[i])
                backtrack(res, temp, nums, target - nums[i], i)
                temp.pop()
                
        backtrack(res, [], candidates, target,0)
        return res
~~~

## 分析
- Time: O（$$ 2^n $$）
- Space：O(n)
