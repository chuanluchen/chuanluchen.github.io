---
layout: project
title: '46-Permutations'
date: 01 July 2020

---
## 题意
> Given a collection of distinct integers, return all possible permutations.
> Example:
> - Input: [1,2,3]
> - Output:
> [
>   [1,2,3],
>   [1,3,2],
>   [2,1,3],
>   [2,3,1],
>   [3,1,2],
>   [3,2,1]
> ]


## 思路
- 回溯法

~~~python
class Solution(object):
    def permute(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        res = []
        if not nums: return res
        
        def backtrack(res,temp,nums):
            if len(temp) == len(nums): #结束条件：数字排满，加入res,结束递归
                res.append(temp[:])
                return
            for n in nums:  # 依次放入
                if n in temp: continue
                temp.append(n) # 当前list加入n
                backtrack(res, temp, nums) # 针对下一个空位，递归调用 ->直到排满
                temp.pop() #退回一层
        
        backtrack(res, [], nums)
        return res
~~~

## 分析
- Time: O(n!) 看排列有多少种
- Space: O(n!)
