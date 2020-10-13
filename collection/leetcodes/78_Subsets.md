---
layout: project
title: '78-Subsets'
date: 01 July 2020

---
## 题意
> Given a set of distinct integers, nums, return all possible subsets (the power set).
> Note: The solution set must not contain duplicate subsets.
> Example:
> - Input: nums = [1,2,3]
> - Output:
> [
>   [3],
>   [1],
>   [2],
>   [1,2,3],
>   [1,3],
>   [2,3],
>   [1,2],
>   []
> ]


## 思路
- 回溯法
- distinct子集：不走重复路径，用index控制，每次回溯+1

~~~python
class Solution(object):
    def subsets(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        res = []
        if not nums: return res
        
        def backtrack(res, temp, nums, index):
            res.append(temp[:])

            for i in range(index, len(nums)):
                temp.append(nums[i])
                backtrack(res, temp, nums, i+1)
                temp.pop()
        
        backtrack(res, [], nums, 0)
        return res
~~~

## 分析
- Time: O（n* 2^n）<-从数学角度去想: 结果个数2^n * 每个结果内部元素遍历个数 n
- Space: O（n* 2^n）
