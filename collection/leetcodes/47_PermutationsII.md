---
layout: project
title: '47-Permutations II'
date: 01 July 2020

---
## 题意
> Given a collection of numbers that might contain duplicates, return all possible unique permutations.
> Example:
> - Input: [1,1,2]
> - Output:
> [
>   [1,1,2],
>   [1,2,1],
>  [2,1,1]
> ]


## 思路
- 回溯法
- 有重复元素：用used数组控制

~~~python
class Solution(object):
    def permuteUnique(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        res = []
        if not nums: return res
        nums.sort()
        
        def backtrack(res, temp, nums, used):
            if len(temp) == len(nums):
                res.append(temp[:]) 
                return
            
            for i, n in enumerate(nums):
                if used[i]: continue # ！！！该数字已经使用过
                #！！！当前数与前一个数相同，前一个还没使用过 -> 在别的树中出现
                if i > 0 and nums[i] == nums[i-1] and not used[i-1]: continue 
                temp.append(n)
                used[i] = True #使用该数，标记为used
                backtrack(res, temp, nums, used)
                used[i] = False # 退回，标记为False 
                temp.pop()
                
        used = [False] * len(nums)
        backtrack(res, [], nums,used)
       
        return res
~~~

## 分析
- Time: O(n!) 看排列有多少种
- Space: O(n!)
