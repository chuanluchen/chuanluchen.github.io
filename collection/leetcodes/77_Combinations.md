---
layout: project
title: '77-Combinations'
date: 01 July 2020

---
## 题意
> Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.
> You may return the answer in any order.
> Example 1:
> - Input: n = 4, k = 2
> - Output:
> [
>   [2,4],
>   [3,4],
>   [2,3],
>   [1,2],
>   [1,3],
>   [1,4],
> ]
>
> Example 2:
> Input: n = 1, k = 1
> Output: [[1]]
> 
> Constraints:
> - 1 <= n <= 20
> - 1 <= k <= n

## 思路
- 回溯法
- 指定长度k, 加入参数进行控制，每下一层k-1 -> k=0结束
- 不能重复，不走回头路，用index控制

~~~python
class Solution(object):
    def combine(self, n, k):
        """
        :type n: int
        :type k: int
        :rtype: List[List[int]]
        """
        res = []
        
        def backtrack(res, temp, n, k, start):
            if k == 0:
                res.append(temp[:])
                return
            
            for i in range(start, n + 1):
                temp.append(i)
                backtrack(res, temp, n, k-1, i + 1)
                temp.pop()
        
        backtrack(res, [], n, k, 1)
        return res
               
~~~

## 分析
- Time：O(k * c(n * k))  数学角度结果：c(n, k) * 每个结果中元素个数k ->c(n, k)展开式为：n!/ (n-k)!k!
- Space：O(k * c(n * k))
